import 'package:FitStack/app/models/workout/workout_model.dart';
import 'package:FitStack/app/repository/workout_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'workout_event.dart';
part 'workout_state.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  final WorkoutRepository workoutRepository;
  WorkoutBloc({required this.workoutRepository}) : super(WorkoutState(status: WorkoutsStatus.initial, workouts: [])) {
    on<WorkoutEvent>((event, emit) {});
    on<CreateWorkout>((event, emit) => onCreateWorkout);
    on<AddWorkout>((event, emit) => onAddWorkout);
    on<DeleteWorkout>((event, emit) => onDeleteWorkout);
    on<UpdateWorkout>((event, emit) => onUpdateWorkout);
    on<WorkoutStreamSubscriptionRequested>((event, emit) => onStreamSubscriptionRequested);
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

  void onDeleteWorkout(DeleteWorkout event, Emitter<WorkoutState> emit) {
    emit(state.copyWith(status: WorkoutsStatus.loading));
    try {
      emit(state.copyWith(status: WorkoutsStatus.loaded, workouts: [...state.workouts]));
    } catch (e) {
      emit(state.copyWith(status: WorkoutsStatus.error));
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
    emit(state.copyWith(status: WorkoutsStatus.loading));

    await emit.forEach<List<Workout>>(
      workoutRepository.getWorkouts(),
      onData: (workouts) => state.copyWith(
        status: WorkoutsStatus.loaded,
        workouts: workouts,
      ),
      onError: (obj, st) {
        Fluttertoast.showToast(
          msg: "error loading workouts${obj.toString()}",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
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
}
