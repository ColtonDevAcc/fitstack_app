part of 'exercise_bloc.dart';

class ExerciseState extends Equatable {
  final List<Exercise> exercises;
  final ExerciseListStatus status;
  const ExerciseState({required this.status, required this.exercises});

  @override
  List<Object> get props => [exercises, status];

  ExerciseState copyWith({
    List<Exercise>? exercises,
    ExerciseListStatus? status,
  }) {
    return ExerciseState(
      exercises: exercises ?? this.exercises,
      status: status ?? this.status,
    );
  }
}

enum ExerciseListStatus { initial, loading, loaded, error }
