import 'package:FitStack/app/models/workout/exercise_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'workout_sets_model.g.dart';

@JsonSerializable()
@CopyWith()
class WorkoutSets extends Equatable {
  final int? id;
  final List<Exercise?>? exercises;

  WorkoutSets({
    required this.exercises,
    required this.id,
  });

  @override
  List<Object?> get props => [exercises, id];

  factory WorkoutSets.fromJson(Map<String, dynamic> json) => _$WorkoutSetsFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutSetsToJson(this);
  factory WorkoutSets.empty() => WorkoutSets(id: 0, exercises: null);
}

//  ID          *int           `json:"id" db:"workout.id"`
// 	Name        *string        `json:"name" db:"workout.name"`
// 	WorkoutSets []*WorkoutSets `json:"workout_sets" db:"workout.sets"`