part of 'workout_bloc.dart';

abstract class WorkoutState extends Equatable {
  const WorkoutState();
  
  @override
  List<Object> get props => [];
}

class WorkoutInitial extends WorkoutState {}
