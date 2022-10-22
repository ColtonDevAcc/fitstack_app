part of 'program_bloc.dart';

class ProgramEvent extends Equatable {
  const ProgramEvent();

  @override
  List<Object> get props => [];
}

class UpdateProgram extends ProgramEvent {}

class DeleteProgram extends ProgramEvent {}

class CreateProgram extends ProgramEvent {}
