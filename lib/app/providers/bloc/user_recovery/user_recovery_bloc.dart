import 'dart:developer';

import 'package:FitStack/app/helpers/fitstack_error_toast.dart';
import 'package:FitStack/app/models/muscle/muscle_model.dart';
import 'package:FitStack/app/models/muscle/recovery_model.dart';
import 'package:FitStack/app/repository/muscle_repository.dart';
import 'package:FitStack/app/repository/user_recovery_repository.dart';
import 'package:FitStack/app/services/muscle_service.dart';
import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

part 'user_recovery_event.dart';
part 'user_recovery_state.dart';

class UserRecoveryBloc extends Bloc<UserRecoveryEvent, UserRecoveryState> {
  final UserRecoveryRepository userRecoveryRepository;
  final MuscleRepository muscleRepository;
  UserRecoveryBloc({required this.muscleRepository, required this.userRecoveryRepository})
      : super(
          UserRecoveryState(
            status: UserRecoveryStatus.initial,
            userRecovery: Recovery.empty(),
            frontMuscleList: const [],
            minorMuscles: const [],
          ),
        ) {
    on<UserRecoveryRequested>(_onUserRecoveryRequested);
    on<UserRecoveryRefreshRequested>(_onUserRecoveryRefreshRequested);
    on<UserRecoveryReset>(_onUserRecoveryReset);
    on<UserRecoveryUpdate>(_onUserRecoveryUpdate);
  }

  Future<void> _onUserRecoveryRequested(UserRecoveryRequested event, Emitter<UserRecoveryState> emit) async {
    emit(state.copyWith(status: UserRecoveryStatus.loading));
    try {
      final List<Muscle> frontMuscleList = await muscleRepository.parseMuscleList(front: true);
      final userRecovery = await userRecoveryRepository.getUserRecovery();
      emit(state.copyWith(status: UserRecoveryStatus.success, userRecovery: userRecovery, frontMuscleList: frontMuscleList));
    } catch (e) {
      log("failed to load user recovery $e");
      FitStackToast.showErrorToast("Failed to load user recovery");
      emit(state.copyWith(status: UserRecoveryStatus.failure));
    }
  }

  Future<void> _onUserRecoveryRefreshRequested(UserRecoveryRefreshRequested event, Emitter<UserRecoveryState> emit) async {
    try {
      final userRecovery = await userRecoveryRepository.getUserRecovery();
      emit(state.copyWith(status: UserRecoveryStatus.success, userRecovery: userRecovery));
    } catch (_) {
      emit(state);
    }
  }

  Future<void> _onUserRecoveryReset(UserRecoveryReset event, Emitter<UserRecoveryState> emit) async {
    emit(UserRecoveryState(status: UserRecoveryStatus.initial, userRecovery: Recovery.empty(), frontMuscleList: const [], minorMuscles: const []));
  }

  Future<void> _onUserRecoveryUpdate(UserRecoveryUpdate event, Emitter<UserRecoveryState> emit) async {
    emit(state.copyWith(userRecovery: event.userRecovery));
  }
}
