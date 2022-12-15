part of 'exercise_bloc.dart';

class ExerciseState extends Equatable {
  final List<Exercise> exercises;
  final ExerciseListStatus status;
  final Exercise currentlyEditingExercise;
  final List<Muscle> minorMuscles;
  final List<Muscle> majorMuscles;
  final List<Muscle> frontMuscleList;
  final List<Muscle> backMuscleList;
  final int muscleAnatomyViewRotationIndex;

  const ExerciseState({
    required this.muscleAnatomyViewRotationIndex,
    required this.backMuscleList,
    required this.majorMuscles,
    required this.frontMuscleList,
    required this.minorMuscles,
    required this.currentlyEditingExercise,
    required this.status,
    required this.exercises,
  });

  @override
  List<Object> get props => [
        backMuscleList,
        exercises,
        status,
        currentlyEditingExercise,
        minorMuscles,
        frontMuscleList,
        majorMuscles,
        muscleAnatomyViewRotationIndex,
      ];

  ExerciseState copyWith({
    List<Exercise>? exercises,
    ExerciseListStatus? status,
    Exercise? editingExercise,
    List<Muscle>? minorMuscles,
    List<Muscle>? frontMuscleList,
    List<Muscle>? majorMuscles,
    List<Muscle>? backMuscleList,
    int? muscleAnatomyViewRotationIndex,
  }) {
    return ExerciseState(
      exercises: exercises ?? this.exercises,
      status: status ?? this.status,
      currentlyEditingExercise: editingExercise ?? currentlyEditingExercise,
      minorMuscles: minorMuscles ?? this.minorMuscles,
      frontMuscleList: frontMuscleList ?? this.frontMuscleList,
      majorMuscles: majorMuscles ?? this.majorMuscles,
      backMuscleList: backMuscleList ?? this.backMuscleList,
      muscleAnatomyViewRotationIndex: muscleAnatomyViewRotationIndex ?? this.muscleAnatomyViewRotationIndex,
    );
  }
}

enum ExerciseListStatus { initial, loading, loaded, error }
