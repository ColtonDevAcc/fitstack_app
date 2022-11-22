part of 'active_workout_bloc.dart';

abstract class ActiveWorkoutEvent extends Equatable {
  const ActiveWorkoutEvent();

  @override
  List<Object> get props => [];
}

class ActiveWorkoutStarted extends ActiveWorkoutEvent {}

class ActiveWorkoutPaused extends ActiveWorkoutEvent {}

class ActiveWorkoutResumed extends ActiveWorkoutEvent {}

class ActiveWorkoutStopped extends ActiveWorkoutEvent {}

class ActiveWorkoutExerciseAdded extends ActiveWorkoutEvent {
  final Exercise exercise;
  const ActiveWorkoutExerciseAdded({required this.exercise});

  @override
  List<Object> get props => [exercise];
}

class ActiveWorkoutExerciseRemoved extends ActiveWorkoutEvent {
  final Exercise exercise;
  const ActiveWorkoutExerciseRemoved({required this.exercise});

  @override
  List<Object> get props => [exercise];
}

class ActiveWorkoutExerciseUpdated extends ActiveWorkoutEvent {
  final Exercise exercise;
  const ActiveWorkoutExerciseUpdated({required this.exercise});

  @override
  List<Object> get props => [exercise];
}

class ActiveWorkoutExerciseMoved extends ActiveWorkoutEvent {
  final int oldIndex;
  final int newIndex;
  const ActiveWorkoutExerciseMoved({required this.oldIndex, required this.newIndex});

  @override
  List<Object> get props => [oldIndex, newIndex];
}

class LoadExerciseList extends ActiveWorkoutEvent {}
