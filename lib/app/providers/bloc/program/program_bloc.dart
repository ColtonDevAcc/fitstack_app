import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'program_event.dart';
part 'program_state.dart';

class ProgramBloc extends Bloc<ProgramEvent, ProgramState> {
  ProgramBloc() : super(ProgramState()) {
    on<ProgramEvent>((event, emit) {});
  }
}
