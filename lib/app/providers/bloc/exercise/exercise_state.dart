part of 'exercise_bloc.dart';

class ExerciseState extends Equatable {
  final List<Exercise> exercises;
  final ExerciseListStatus status;
  final Exercise currentlyEditingExercise;
  final List<Muscle> minorMuscles;
  final List<Muscle> majorMuscles;
  final List<Muscle> muscleList;

  const ExerciseState({
    required this.majorMuscles,
    required this.muscleList,
    required this.minorMuscles,
    required this.currentlyEditingExercise,
    required this.status,
    required this.exercises,
  });

  @override
  List<Object> get props => [
        exercises,
        status,
        currentlyEditingExercise,
        minorMuscles,
        muscleList,
        majorMuscles,
      ];

  ExerciseState copyWith({
    List<Exercise>? exercises,
    ExerciseListStatus? status,
    Exercise? editingExercise,
    List<Muscle>? minorMuscles,
    List<Muscle>? muscleList,
    List<Muscle>? majorMuscles,
  }) {
    return ExerciseState(
        exercises: exercises ?? this.exercises,
        status: status ?? this.status,
        currentlyEditingExercise: editingExercise ?? this.currentlyEditingExercise,
        minorMuscles: minorMuscles ?? this.minorMuscles,
        muscleList: muscleList ?? this.muscleList,
        majorMuscles: majorMuscles ?? this.majorMuscles);
  }
}

enum ExerciseListStatus { initial, loading, loaded, error }
