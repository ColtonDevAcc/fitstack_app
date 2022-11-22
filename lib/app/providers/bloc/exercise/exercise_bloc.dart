import 'package:FitStack/app/models/workout/exercise_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'exercise_event.dart';
part 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final exerciseRepository;
  ExerciseBloc({required this.exerciseRepository}) : super(ExerciseState(exercises: [], status: ExerciseListStatus.initial)) {
    on<ExerciseEvent>((event, emit) {});
    on<LoadExercises>(onLoadExercises);
    on<AddCustomExercise>(onAddCustomExercise);
    on<UpdateExercise>(onUpdateExercise);
  }

  void onLoadExercises(LoadExercises event, Emitter<ExerciseState> emit) async {
    try {
      emit(state.copyWith(status: ExerciseListStatus.loading));
      final List<Exercise> exercises = await exerciseRepository.getExercises();
      emit(state.copyWith(status: ExerciseListStatus.loaded, exercises: exercises));
    } catch (e) {
      emit(state.copyWith(status: ExerciseListStatus.error));
      Fluttertoast.showToast(msg: "Failed to load exercises");
    }
  }

  void onAddCustomExercise(AddCustomExercise event, Emitter<ExerciseState> emit) {
    final exercises = List<Exercise>.from(state.exercises)..add(event.exercise);
    emit(state.copyWith(exercises: exercises));
  }

  void onUpdateExercise(UpdateExercise event, Emitter<ExerciseState> emit) {
    final exercises = List<Exercise>.from(state.exercises);
    final index = exercises.indexWhere((exercise) => exercise.id == event.exercise.id);
    exercises[index] = event.exercise;
    emit(state.copyWith(exercises: exercises));
  }
}
