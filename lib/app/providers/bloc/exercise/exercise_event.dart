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
