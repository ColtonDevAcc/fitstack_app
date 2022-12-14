import 'package:FitStack/app/models/workout/exercise_model.dart';
import 'package:FitStack/app/repository/active_workout_repository.dart';
import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

part 'active_workout_event.dart';
part 'active_workout_state.dart';

class ActiveWorkoutBloc extends Bloc<ActiveWorkoutEvent, ActiveWorkoutState> {
  final ActiveWorkoutRepository activeWorkoutRepository;
  ActiveWorkoutBloc({required this.activeWorkoutRepository})
      : super(
          const ActiveWorkoutState(
            exercises: [],
            status: ExerciseListStatus.initial,
          ),
        ) {
    on<ActiveWorkoutEvent>((event, emit) {});
    on<ActiveWorkoutExerciseAdded>(onWorkoutExerciseAdded);
    on<ActiveWorkoutExerciseRemoved>(onWorkoutExerciseRemoved);
    on<ActiveWorkoutExerciseUpdated>(onWorkoutExerciseUpdated);
    on<ActiveWorkoutExerciseMoved>(onWorkoutExerciseMoved);
    on<LoadExerciseList>(onLoadExercises);
  }

  void onWorkoutExerciseAdded(ActiveWorkoutExerciseAdded event, Emitter<ActiveWorkoutState> emit) {
    final exercises = List<Exercise>.from(state.exercises)..add(event.exercise);
    emit(state.copyWith(exercises: exercises));
  }

  void onWorkoutExerciseRemoved(ActiveWorkoutExerciseRemoved event, Emitter<ActiveWorkoutState> emit) {
    final exercises = List<Exercise>.from(state.exercises)..remove(event.exercise);
    emit(state.copyWith(exercises: exercises));
  }

  void onWorkoutExerciseUpdated(ActiveWorkoutExerciseUpdated event, Emitter<ActiveWorkoutState> emit) {
    final exercises = List<Exercise>.from(state.exercises);
    final index = exercises.indexWhere((exercise) => exercise.id == event.exercise.id);
    exercises[index] = event.exercise;
    emit(state.copyWith(exercises: exercises));
  }

  void onWorkoutExerciseMoved(ActiveWorkoutExerciseMoved event, Emitter<ActiveWorkoutState> emit) {
    final exercises = List<Exercise>.from(state.exercises);
    final exercise = exercises.removeAt(event.oldIndex);
    exercises.insert(event.newIndex, exercise);
    emit(state.copyWith(exercises: exercises));
  }

  void onLoadExercises(LoadExerciseList event, Emitter<ActiveWorkoutState> emit) {
    emit(state.copyWith(status: ExerciseListStatus.loading));
  }
}
