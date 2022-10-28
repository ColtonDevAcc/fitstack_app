import 'package:FitStack/app/models/workout/workout_sets_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'workout_model.g.dart';

@JsonSerializable()
@CopyWith()
class Workout extends Equatable {
  final int? id;
  final String? name;
  final List<WorkoutSets>? workout_sets;

  Workout({
    required this.id,
    required this.workout_sets,
    required this.name,
  });

  @override
  List<Object?> get props => [];

  factory Workout.fromJson(Map<String, dynamic> json) => _$WorkoutFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutToJson(this);
  factory Workout.empty() => Workout(name: '', id: 0, workout_sets: null);
}

//  ID          *int           `json:"id" db:"workout.id"`
// 	Name        *string        `json:"name" db:"workout.name"`
// 	WorkoutSets []*WorkoutSets `json:"workout_sets" db:"workout.sets"`