import 'dart:developer';

import 'package:FitStack/app/models/workout/workout_model.dart';
import 'package:FitStack/app/repository/workout_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

part 'workout_event.dart';
part 'workout_state.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  final WorkoutRepository workoutRepository;
  WorkoutBloc({required this.workoutRepository})
      : super(
          const WorkoutState(
            status: WorkoutsStatus.initial,
            workouts: [],
            workoutName: 'New Workout',
          ),
        ) {
    on<CreateWorkout>(onCreateWorkout);
    on<AddWorkout>(onAddWorkout);
    on<DeleteWorkout>(onDeleteWorkout);
    on<UpdateWorkout>(onUpdateWorkout);
    on<WorkoutStreamSubscriptionRequested>(onStreamSubscriptionRequested);
    on<UpdateWorkoutName>(onUpdateWorkoutName);
  }

  void onCreateWorkout(CreateWorkout event, Emitter<WorkoutState> emit) {
    emit(state.copyWith(status: WorkoutsStatus.loading));
    try {
      emit(state.copyWith(status: WorkoutsStatus.loaded, workouts: [...state.workouts]));
    } catch (e) {
      emit(state.copyWith(status: WorkoutsStatus.error));
    }
  }

  void onAddWorkout(AddWorkout event, Emitter<WorkoutState> emit) {
    emit(state.copyWith(status: WorkoutsStatus.loading));
    try {
      emit(state.copyWith(status: WorkoutsStatus.loaded, workouts: [...state.workouts]));
    } catch (e) {
      emit(state.copyWith(status: WorkoutsStatus.error));
    }
  }

  Future<void> onDeleteWorkout(DeleteWorkout event, Emitter<WorkoutState> emit) async {
    emit(state.copyWith(status: WorkoutsStatus.loading));
    try {
      await workoutRepository.deleteWorkout(id: event.id);
      final newWorkoutList = [...state.workouts]..removeWhere((element) => element.id == event.id);
      emit(state.copyWith(workouts: newWorkoutList));
    } catch (e) {
      emit(state.copyWith(status: WorkoutsStatus.error));
      log("error deleting workout: $e");
      Fluttertoast.showToast(
        msg: "Error deleting workout",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  void onUpdateWorkout(UpdateWorkout event, Emitter<WorkoutState> emit) {
    emit(state.copyWith(status: WorkoutsStatus.loading));
    try {
      emit(state.copyWith(status: WorkoutsStatus.loaded, workouts: [...state.workouts]));
    } catch (e) {
      emit(state.copyWith(status: WorkoutsStatus.error));
    }
  }

  Future<void> onStreamSubscriptionRequested(WorkoutStreamSubscriptionRequested event, Emitter<WorkoutState> emit) async {
    log("onStreamSubscriptionRequested");

    emit(state.copyWith(status: WorkoutsStatus.loading));
    await emit.forEach<List<Workout>>(
      workoutRepository.getWorkouts(),
      onData: (workouts) {
        return state.copyWith(
          status: WorkoutsStatus.loaded,
          workouts: workouts,
        );
      },
      onError: (obj, st) {
        Fluttertoast.showToast(
          msg: "error loading workouts${obj.toString()}",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        return state.copyWith(
          status: WorkoutsStatus.error,
        );
      },
    );
  }

  void onUpdateWorkoutName(UpdateWorkoutName event, Emitter<WorkoutState> emit) {
    emit(state.copyWith(newWorkoutName: event.name));
  }
}
