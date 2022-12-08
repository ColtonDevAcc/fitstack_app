import 'package:FitStack/app/helpers/fitstack_error_toast.dart';
import 'package:FitStack/app/models/user/user_statistic_model.dart';
import 'package:FitStack/app/repository/user_health_repository.dart';
import 'package:FitStack/app/repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'user_statistics_event.dart';
part 'user_statistics_state.dart';

class UserStatisticsBloc extends Bloc<UserStatisticsEvent, UserStatisticsState> {
  final UserRepository userRepository;
  final UserHealthRepository userHealthRepository;

  UserStatisticsBloc({required this.userRepository, required this.userHealthRepository})
      : super(UserStatisticsState(
          status: UserStatisticsStatus.initial,
          userStatistic: UserStatistic.empty(),
        )) {
    on<UserStatisticsRequested>(onUserStatisticsRequested);
    on<UserStatisticsUpdated>(onUserStatisticsUpdated);
    on<UserStatisticsSnapshotUpdateRequested>(onUserStatisticsSnapshotUpdateRequested);
  }

  void onUserStatisticsRequested(UserStatisticsRequested event, Emitter<UserStatisticsState> emit) async {
    emit(state.copyWith(status: UserStatisticsStatus.loading));
    try {
      final token = await FirebaseAuth.instance.currentUser?.getIdToken();
      final userStatistic = await userRepository.getStatisticsSnapshot(token: token!);
      emit(state.copyWith(status: UserStatisticsStatus.loaded, userStatistic: userStatistic));
    } catch (e) {
      emit(state.copyWith(status: UserStatisticsStatus.error));
      FitStackToast.showErrorToast("error retrieving user statistics");
    }
    add(UserStatisticsSnapshotUpdateRequested());
  }

  void onUserStatisticsUpdated(UserStatisticsUpdated event, Emitter<UserStatisticsState> emit) async {
    emit(state.copyWith(status: UserStatisticsStatus.loading));
    try {
      final token = await FirebaseAuth.instance.currentUser?.getIdToken();
      await userRepository.updateStatistics(token: token!, statistic: event.userStatistic);
      emit(state.copyWith(status: UserStatisticsStatus.loaded, userStatistic: event.userStatistic));
    } catch (e) {
      emit(state.copyWith(status: UserStatisticsStatus.error));
      FitStackToast.showErrorToast("error updating user statistics");
    }
  }

  void onUserStatisticsSnapshotUpdateRequested(UserStatisticsSnapshotUpdateRequested event, Emitter<UserStatisticsState> emit) async {
    String userToken = await FirebaseAuth.instance.currentUser?.getIdToken() ?? "";
    Duration? fetchDate = state.userStatistic.updated_at?.difference(DateTime.now()) ?? Duration(days: 365);
    UserStatistic statistic = await userRepository.updateStatisticsSnapshot(token: userToken, fetchDate: fetchDate);

    emit(
      state.copyWith(
        userStatistic: state.userStatistic.copyWith(
          updated_at: DateTime.now(),
          bmi_log: statistic.bmi_log != null ? [...state.userStatistic.bmi_log ?? [] + statistic.bmi_log!] : state.userStatistic.bmi_log,
          weight_log:
              statistic.weight_log != null ? [...state.userStatistic.weight_log ?? [] + statistic.weight_log!] : state.userStatistic.weight_log,
          active_energy:
              statistic.active_energy != null ? state.userStatistic.active_energy! + statistic.active_energy! : state.userStatistic.active_energy,
          active_minutes_log: statistic.active_minutes_log != null
              ? [...state.userStatistic.active_minutes_log ?? [] + statistic.active_minutes_log!]
              : state.userStatistic.active_minutes_log,
          sleep_log: statistic.sleep_log != null ? [...state.userStatistic.sleep_log ?? [] + statistic.sleep_log!] : state.userStatistic.sleep_log,
          step_log: statistic.step_log != null ? [...state.userStatistic.step_log ?? [] + statistic.step_log!] : state.userStatistic.step_log,
        ),
      ),
    );
  }
}

enum UserStatisticsStatus { initial, loading, loaded, error }
