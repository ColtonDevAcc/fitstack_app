import 'dart:developer';
import 'dart:io';

import 'package:FitStack/app/helpers/fitstack_error_toast.dart';
import 'package:FitStack/app/models/muscle/muscle_model.dart';
import 'package:FitStack/app/models/workout/exercise_model.dart';
import 'package:FitStack/app/services/firebase_storage_service.dart';
import 'package:FitStack/app/services/muscle_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

part 'exercise_event.dart';
part 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final exerciseRepository;
  ExerciseBloc({required this.exerciseRepository})
      : super(ExerciseState(
          exercises: [],
          status: ExerciseListStatus.initial,
          currentlyEditingExercise: Exercise.empty(),
          minorMuscles: [],
          muscleList: MuscleService().muscleList,
          majorMuscles: [],
        )) {
    on<ExerciseEvent>((event, emit) {});
    on<LoadExercises>(onLoadExercises);
    on<AddCustomExercise>(onAddCustomExercise);
    on<UpdateExercise>(onUpdateExercise);
    on<EditExerciseImage>(onEditExerciseImage);
    on<EditExercise>(onEditExercise);
    on<SelectMajorMuscle>(onSelectMajorMuscle);
    on<SelectMinorMuscle>(onSelectMinorMuscle);
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

  void onEditExerciseImage(EditExerciseImage event, Emitter<ExerciseState> emit) async {
    try {
      await ImagePicker().pickImage(source: ImageSource.gallery).then((value) async {
        if (value != null) {
          final exercises = List<Exercise>.from(state.exercises);
          final index = exercises.indexWhere((exercise) => exercise.id == state.currentlyEditingExercise.id);
          exercises[index] = state.currentlyEditingExercise;

          await FirebaseStorageService()
              .uploadImage('exercises', state.currentlyEditingExercise.id.toString(), File(value.path))
              .then((imageURL) async {
            var imageList = state.currentlyEditingExercise.images ?? [];
            imageList.add(imageURL);
            List<String> newImageList = imageList;

            exercises[index] = state.currentlyEditingExercise.copyWith(images: newImageList);
            emit(state.copyWith(exercises: exercises, editingExercise: state.currentlyEditingExercise.copyWith(images: newImageList)));
            await exerciseRepository.updateExercise(state.currentlyEditingExercise.copyWith(images: newImageList));
          });
        }
      });
    } catch (e) {
      log("Failed to edit exercise image: $e");
      FitStackErrorToast.show("Failed to edit exercise image");
    }
  }

  void onEditExercise(EditExercise event, Emitter<ExerciseState> emit) {
    emit(state.copyWith(editingExercise: event.exercise));
  }

  void onSelectMajorMuscle(SelectMajorMuscle event, Emitter<ExerciseState> emit) {
    final selectedMuscles = List<Muscle>.from(state.majorMuscles);
    final minorMuscles = List<Muscle>.from(state.minorMuscles);

    if (selectedMuscles.contains(event.muscle)) {
      selectedMuscles.remove(event.muscle);
    } else if (minorMuscles.contains(event.muscle)) {
      minorMuscles.remove(event.muscle);
      emit(state.copyWith(minorMuscles: minorMuscles));
    } else if (!minorMuscles.contains(event.muscle) && event.muscle.type != PrimaryMuscleGroups.empty) {
      selectedMuscles.add(event.muscle);
    }
    emit(state.copyWith(majorMuscles: selectedMuscles));
  }

  void onSelectMinorMuscle(SelectMinorMuscle event, Emitter<ExerciseState> emit) {
    final selectedMuscles = List<Muscle>.from(state.minorMuscles);
    final majorMuscles = List<Muscle>.from(state.majorMuscles);

    if (selectedMuscles.contains(event.muscle)) {
      selectedMuscles.remove(event.muscle);
    } else if (majorMuscles.contains(event.muscle)) {
      majorMuscles.remove(event.muscle);
      emit(state.copyWith(majorMuscles: majorMuscles));
    } else if (!majorMuscles.contains(event.muscle) && event.muscle.type != PrimaryMuscleGroups.empty) {
      selectedMuscles.add(event.muscle);
    }
    emit(state.copyWith(minorMuscles: selectedMuscles));
  }
}
