part of 'program_cubit.dart';

class ProgramState extends Equatable {
  final List<Program>? programs;
  const ProgramState({required this.programs});

  @override
  List<Object?> get props => [programs];

  ProgramState copyWith({final List<Program>? programs}) {
    return ProgramState(
      programs: programs ?? this.programs,
    );
  }
}
