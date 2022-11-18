part of 'workout_bloc.dart';

abstract class WorkoutEvent extends Equatable {
  const WorkoutEvent();

  @override
  List<Object> get props => [];
}

class AddWorkout extends WorkoutEvent {}

class CreateWorkout extends WorkoutEvent {}

class DeleteWorkout extends WorkoutEvent {
  final int id;

  DeleteWorkout({required this.id});

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'DeleteWorkout { id: $id }';
}

class UpdateWorkout extends WorkoutEvent {}

class WorkoutStreamSubscriptionRequested extends WorkoutEvent {}
