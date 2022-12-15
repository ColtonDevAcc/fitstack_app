import 'package:FitStack/app/models/workout/exercise_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'workout_sets_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true, anyMap: true)
class WorkoutSets extends Equatable {
  final int? id;
  final List<Exercise?>? exercises;

  const WorkoutSets({
    required this.exercises,
    required this.id,
  });

  @override
  List<Object?> get props => [exercises, id];

  factory WorkoutSets.fromJson(Map<String, dynamic> json) => _$WorkoutSetsFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutSetsToJson(this);
  factory WorkoutSets.empty() => const WorkoutSets(id: 0, exercises: null);

  WorkoutSets copyWith({
    int? id,
    List<Exercise?>? exercises,
  }) {
    return WorkoutSets(
      id: id ?? this.id,
      exercises: exercises ?? this.exercises,
    );
  }
}
