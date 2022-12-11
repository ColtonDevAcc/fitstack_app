import 'package:FitStack/app/models/user/user_model.dart';
import 'package:FitStack/app/models/workout/workout_sets_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'workout_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true, anyMap: true)
@CopyWith()
class Workout extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final User? creator;
  final String? creator_id;
  final List<WorkoutSets>? workout_sets;

  Workout({
    this.creator_id,
    this.creator,
    this.description,
    required this.id,
    required this.workout_sets,
    required this.title,
  });

  @override
  List<Object?> get props => [];

  factory Workout.fromJson(Map<String, dynamic> json) => _$WorkoutFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutToJson(this);
  factory Workout.empty() => Workout(title: '', id: 0, workout_sets: null);
}

//  ID          *int           `json:"id" db:"workout.id"`
// 	Name        *string        `json:"name" db:"workout.name"`
// 	WorkoutSets []*WorkoutSets `json:"workout_sets" db:"workout.sets"`