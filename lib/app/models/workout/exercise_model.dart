import 'package:FitStack/app/models/user/user_model.dart';
import 'package:FitStack/app/models/workout/exercise_equipment_model.dart';
import 'package:FitStack/app/models/workout/muscle_target_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exercise_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true, anyMap: true)
class Exercise extends Equatable {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'images')
  final List<String>? images;
  @JsonKey(name: 'met_value')
  final double? metValue;
  @JsonKey(name: 'creator')
  final User creator;
  @JsonKey(name: 'creator_id')
  final String creatorId;
  @JsonKey(name: 'type')
  final ExerciseType? type;
  @JsonKey(name: 'exercise_equipment')
  final List<ExerciseEquipment>? exerciseEquipment;
  @JsonKey(name: 'muscle_target')
  final List<MuscleTarget>? muscleTarget;

  const Exercise({
    required this.creatorId,
    required this.creator,
    required this.muscleTarget,
    required this.name,
    required this.description,
    required this.images,
    required this.metValue,
    required this.type,
    required this.exerciseEquipment,
    required this.id,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        images,
        metValue,
        type,
        exerciseEquipment,
        muscleTarget,
        creator,
        creatorId,
      ];

  factory Exercise.fromJson(Map<String, dynamic> json) => _$ExerciseFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseToJson(this);
  factory Exercise.empty() => Exercise(
        id: 0,
        name: '',
        description: '',
        images: const [],
        metValue: 0,
        type: ExerciseType.pull,
        exerciseEquipment: const [],
        muscleTarget: const [],
        creator: User.empty(),
        creatorId: '',
      );
}

enum ExerciseType {
  push,
  pull,
  legs,
  core,
  cardio,
  other,
}
