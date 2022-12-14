import 'dart:developer';

import 'package:FitStack/app/helpers/fitstack_error_toast.dart';
import 'package:FitStack/app/models/logs/active_energy_log_model.dart';
import 'package:FitStack/app/models/logs/bmi_log_model.dart';
import 'package:FitStack/app/models/logs/body_fat_log_model.dart';
import 'package:FitStack/app/models/logs/log_model.dart';
import 'package:FitStack/app/models/logs/step_log_model.dart';
import 'package:FitStack/app/models/logs/weight_log_model.dart';
import 'package:FitStack/app/models/user/user_statistic_model.dart';
import 'package:FitStack/app/repository/user_health_repository.dart';
import 'package:FitStack/app/repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:health/health.dart';

part 'user_statistics_event.dart';
part 'user_statistics_state.dart';

class UserStatisticsBloc extends Bloc<UserStatisticsEvent, UserStatisticsState> {
  final UserRepository userRepository;
  final UserHealthRepository userHealthRepository;

  UserStatisticsBloc({required this.userRepository, required this.userHealthRepository})
      : super(UserStatisticsState(
          status: UserStatisticsStatus.initial,
          userStatistic: UserStatistic.empty(),
          selected: UserStatistic.empty(),
          snapshotUpdateStatus: StatisticsSnapshotUpdateStatus.initial,
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
    try {
      emit(state.copyWith(snapshotUpdateStatus: StatisticsSnapshotUpdateStatus.loading));
      Duration? fetchDate;
      if (state.userStatistic.updatedAt == null) {
        fetchDate = Duration(days: 365);
      } else {
        fetchDate = DateTime.now().difference(state.userStatistic.updatedAt!);
      }

      UserStatistic statistic = await userRepository.updateStatisticsSnapshot(fetchDate: fetchDate);

      if (statistic == UserStatistic.empty()) {
        emit(state.copyWith(snapshotUpdateStatus: StatisticsSnapshotUpdateStatus.loaded));
        return;
      }

      Map<HealthDataType, List<DateTime>> dateMap = {
        HealthDataType.STEPS: [],
        HealthDataType.WEIGHT: [],
        HealthDataType.BODY_MASS_INDEX: [],
        HealthDataType.ACTIVE_ENERGY_BURNED: [],
        HealthDataType.BODY_FAT_PERCENTAGE: [],
      };
      List<StepsLog> steps = []..addAll(state.userStatistic.stepsLogs ?? []);
      List<WeightLog> weight = []..addAll(state.userStatistic.weightLogs ?? []);
      List<BodyMassIndexLog> bmi = []..addAll(state.userStatistic.bodyMassIndexLogs ?? []);
      List<ActiveEnergyBurnedLog> activeEnergyBurned = []..addAll(state.userStatistic.activeEnergyBurned ?? []);
      List<BodyFatPercentageLog> bodyFatPercentage = []..addAll(state.userStatistic.bodyFatPercentageLogs ?? []);

      statistic.bodyMassIndexLogs?.forEach(
        (element) {
          var createdAtDifference = DateTime.now().difference(element.createdAt);
          if (createdAtDifference.inDays < 30 && dateMap[element.type]!.contains(element.createdAt)) {
            bmi.add(element);
            dateMap[element.type]?.add(element.createdAt);
          }
        },
      );
      statistic.stepsLogs?.forEach(
        (element) {
          var createdAtDifference = DateTime.now().difference(element.createdAt);
          if (createdAtDifference.inDays < 30 && dateMap[element.type]!.contains(element.createdAt)) {
            steps.add(element);
            dateMap[element.type]?.add(element.createdAt);
          }
        },
      );
      statistic.weightLogs?.forEach(
        (element) {
          var createdAtDifference = DateTime.now().difference(element.createdAt);
          if (createdAtDifference.inDays < 30 && dateMap[element.type]!.contains(element.createdAt)) {
            weight.add(element);
            dateMap[element.type]?.add(element.createdAt);
          }
        },
      );
      statistic.activeEnergyBurned?.forEach(
        (element) {
          var createdAtDifference = DateTime.now().difference(element.createdAt);
          if (createdAtDifference.inDays < 30 && dateMap[element.type]!.contains(element.createdAt)) {
            activeEnergyBurned.add(element);
            dateMap[element.type]?.add(element.createdAt);
          }
        },
      );
      statistic.bodyFatPercentageLogs?.forEach(
        (element) {
          var createdAtDifference = DateTime.now().difference(element.createdAt);
          if (createdAtDifference.inDays < 30 && dateMap[element.type]!.contains(element.createdAt)) {
            bodyFatPercentage.add(element);
            dateMap[element.type]?.add(element.createdAt);
          }
        },
      );

      emit(
        state.copyWith(
          snapshotUpdateStatus: StatisticsSnapshotUpdateStatus.loaded,
          userStatistic: state.userStatistic.copyWith(
            updatedAt: DateTime.now().toUtc(),
            stepsLogs: steps,
            weightLogs: weight,
            bodyMassIndexLogs: bmi,
            activeEnergyBurned: activeEnergyBurned,
            bodyFatPercentageLogs: bodyFatPercentage,
          ),
        ),
      );
    } catch (e) {
      emit(state.copyWith(snapshotUpdateStatus: StatisticsSnapshotUpdateStatus.error));
      FitStackToast.showErrorToast("error updating user statistics snapshot");
      log("error updating user statistics snapshot $e");
    }
  }
}

enum UserStatisticsStatus { initial, loading, loaded, error }

enum StatisticsSnapshotUpdateStatus { initial, loading, loaded, error }
