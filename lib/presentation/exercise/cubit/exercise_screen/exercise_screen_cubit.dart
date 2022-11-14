import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'exercise_screen_state.dart';

class ExerciseScreenCubit extends Cubit<ExerciseScreenState> {
  ExerciseScreenCubit() : super(ExerciseScreenState(index: 0));

  void changeIndex(int index) {
    emit(ExerciseScreenState(index: index));
  }

  onWorkoutsPlusButtonPressed() {}

  onProgramsPlusButtonPressed() {}

  onHistoryPlusButtonPressed() {}
}
