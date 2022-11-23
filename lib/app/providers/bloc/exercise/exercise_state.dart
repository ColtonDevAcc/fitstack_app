part of 'exercise_bloc.dart';

class ExerciseState extends Equatable {
  final List<Exercise> exercises;
  final ExerciseListStatus status;
  final Exercise currentlyEditingExercise;
  const ExerciseState({required this.currentlyEditingExercise, required this.status, required this.exercises});

  @override
  List<Object> get props => [
        exercises,
        status,
        currentlyEditingExercise,
      ];

  ExerciseState copyWith({
    List<Exercise>? exercises,
    ExerciseListStatus? status,
    Exercise? editingExercise,
  }) {
    return ExerciseState(
      exercises: exercises ?? this.exercises,
      status: status ?? this.status,
      currentlyEditingExercise: editingExercise ?? this.currentlyEditingExercise,
    );
  }
}

enum ExerciseListStatus { initial, loading, loaded, error }
