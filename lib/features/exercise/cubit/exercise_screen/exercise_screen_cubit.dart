import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

part 'exercise_screen_state.dart';

class ExerciseScreenCubit extends Cubit<ExerciseScreenState> {
  ExerciseScreenCubit() : super(const ExerciseScreenState(index: 0));

  void changeIndex(int index) {
    emit(ExerciseScreenState(index: index));
  }

  onWorkoutsPlusButtonPressed() {}

  onProgramsPlusButtonPressed() {}

  onHistoryPlusButtonPressed() {}
}
