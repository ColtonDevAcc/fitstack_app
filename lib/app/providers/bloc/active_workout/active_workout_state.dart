part of 'active_workout_bloc.dart';

class ActiveWorkoutState extends Equatable {
  final List<Exercise> exercises;
  final ExerciseListStatus status;
  const ActiveWorkoutState({required this.status, required this.exercises});

  @override
  List<Object> get props => [exercises];

  ActiveWorkoutState copyWith({
    List<Exercise>? exercises,
    ExerciseListStatus? status,
  }) {
    return ActiveWorkoutState(
      exercises: exercises ?? this.exercises,
      status: status ?? this.status,
    );
  }
}

enum ActiveWorkoutStatus { started, paused, stopped }

enum ExerciseListStatus { loaded, loading, error, initial }
