part of 'workout_bloc.dart';

abstract class WorkoutEvent extends Equatable {
  const WorkoutEvent();

  @override
  List<Object> get props => [];
}

class AddWorkout extends WorkoutEvent {}

class CreateWorkout extends WorkoutEvent {}

class DeleteWorkout extends WorkoutEvent {}

class UpdateWorkout extends WorkoutEvent {}
