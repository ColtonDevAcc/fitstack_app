import 'package:FitStack/app/models/user/user_model.dart';
import 'package:FitStack/app/models/workout/workout_sets_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'workout_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true, anyMap: true)
class Workout extends Equatable {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'creator')
  final User? creator;
  @JsonKey(name: 'creator_id')
  final String? creatorId;
  @JsonKey(name: 'workout_sets')
  final List<WorkoutSets>? workoutSets;

  const Workout({
    this.creatorId,
    this.creator,
    this.description,
    required this.id,
    required this.workoutSets,
    required this.title,
  });

  @override
  List<Object?> get props => [];

  factory Workout.fromJson(Map<String, dynamic> json) => _$WorkoutFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutToJson(this);
  factory Workout.empty() => const Workout(title: '', id: 0, workoutSets: null);

  Workout copyWith({
    int? id,
    String? title,
    String? description,
    User? creator,
    String? creatorId,
    List<WorkoutSets>? workoutSets,
  }) {
    return Workout(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      creator: creator ?? this.creator,
      creatorId: creatorId ?? this.creatorId,
      workoutSets: workoutSets ?? this.workoutSets,
    );
  }
}
