part of 'program_cubit.dart';

class ProgramState extends Equatable {
  final List<Program>? programs;
  final ProgramStatus status;
  const ProgramState({required this.status, required this.programs});

  @override
  List<Object?> get props => [programs, status];

  ProgramState copyWith({
    final List<Program>? programs,
    final ProgramStatus? status,
  }) {
    return ProgramState(
      programs: programs ?? this.programs,
      status: status ?? this.status,
    );
  }
}

enum ProgramStatus {
  initial,
  loading,
  success,
  failure,
}
