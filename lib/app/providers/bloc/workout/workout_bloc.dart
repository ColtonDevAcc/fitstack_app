import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'workout_event.dart';
part 'workout_state.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  WorkoutBloc() : super(WorkoutInitial()) {
    on<WorkoutEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
