part of 'workout_bloc.dart';

class WorkoutState extends Equatable {
  final List<Workout> workouts;
  final WorkoutsStatus status;
  final String WorkoutName;
  const WorkoutState({required this.WorkoutName, required this.status, required this.workouts});

  @override
  List<Object> get props => [workouts, status, WorkoutName];

  WorkoutState copyWith({
    List<Workout>? workouts,
    WorkoutsStatus? status,
    String? newWorkoutName,
  }) {
    return WorkoutState(
      workouts: workouts ?? this.workouts,
      status: status ?? this.status,
      WorkoutName: newWorkoutName ?? this.WorkoutName,
    );
  }
}

enum WorkoutsStatus { initial, loading, loaded, error }
