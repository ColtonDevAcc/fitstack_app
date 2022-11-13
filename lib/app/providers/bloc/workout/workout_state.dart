part of 'workout_bloc.dart';

class WorkoutState extends Equatable {
  final List<Workout> workouts;
  final WorkoutsStatus status;
  const WorkoutState({required this.status, required this.workouts});

  @override
  List<Object> get props => [workouts, status];

  WorkoutState copyWith({
    List<Workout>? workouts,
    WorkoutsStatus? status,
  }) {
    return WorkoutState(
      workouts: workouts ?? this.workouts,
      status: status ?? this.status,
    );
  }
}

enum WorkoutsStatus { initial, loading, loaded, error }
