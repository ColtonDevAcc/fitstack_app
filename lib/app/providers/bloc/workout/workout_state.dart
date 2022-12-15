part of 'workout_bloc.dart';

class WorkoutState extends Equatable {
  final List<Workout> workouts;
  final WorkoutsStatus status;
  final String workoutName;
  const WorkoutState({required this.workoutName, required this.status, required this.workouts});

  @override
  List<Object> get props => [workouts, status, workoutName];

  WorkoutState copyWith({
    List<Workout>? workouts,
    WorkoutsStatus? status,
    String? newWorkoutName,
  }) {
    return WorkoutState(
      workouts: workouts ?? this.workouts,
      status: status ?? this.status,
      workoutName: newWorkoutName ?? workoutName,
    );
  }
}

enum WorkoutsStatus { initial, loading, loaded, error }
