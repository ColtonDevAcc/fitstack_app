part of 'exercise_bloc.dart';

abstract class ExerciseEvent extends Equatable {
  const ExerciseEvent();

  @override
  List<Object> get props => [];
}

class AddCustomExercise extends ExerciseEvent {
  final Exercise exercise;
  const AddCustomExercise({required this.exercise});
}

class LoadExercises extends ExerciseEvent {}

class UpdateExercise extends ExerciseEvent {
  final Exercise exercise;
  const UpdateExercise({required this.exercise});
}

class DeleteExercise extends ExerciseEvent {
  final Exercise exercise;
  const DeleteExercise({required this.exercise});
}

class EditExercise extends ExerciseEvent {
  final Exercise exercise;
  const EditExercise({required this.exercise});
}

class EditExerciseImage extends ExerciseEvent {
  const EditExerciseImage();
}

class SelectMajorMuscle extends ExerciseEvent {
  final Muscle muscle;
  const SelectMajorMuscle({required this.muscle});
}

class SelectMinorMuscle extends ExerciseEvent {
  final Muscle muscle;
  const SelectMinorMuscle({required this.muscle});
}

class RotateMuscleAnatomyView extends ExerciseEvent {
  const RotateMuscleAnatomyView();
}
