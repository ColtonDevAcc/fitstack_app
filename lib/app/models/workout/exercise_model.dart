import 'package:FitStack/app/models/user/user_model.dart';
import 'package:FitStack/app/models/workout/exercise_equipment_model.dart';
import 'package:FitStack/app/models/workout/muscle_target_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'exercise_model.g.dart';

@JsonSerializable()
@CopyWith()
class Exercise extends Equatable {
  final int? id;
  final String? name;
  final String? description;
  final List<String>? images;
  final double? met_value;
  final User creator;
  final String creator_id;
  final ExerciseType? type;
  final List<ExerciseEquipment>? exercise_equipment;
  final List<MuscleTarget>? muscle_target;

  Exercise({
    required this.creator_id,
    required this.creator,
    required this.muscle_target,
    required this.name,
    required this.description,
    required this.images,
    required this.met_value,
    required this.type,
    required this.exercise_equipment,
    required this.id,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        images,
        met_value,
        type,
        exercise_equipment,
        muscle_target,
        creator,
        creator_id,
      ];

  factory Exercise.fromJson(Map<String, dynamic> json) => _$ExerciseFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseToJson(this);
  factory Exercise.empty() => Exercise(
        id: 0,
        name: '',
        description: '',
        images: [],
        met_value: 0,
        type: ExerciseType.pull,
        exercise_equipment: [],
        muscle_target: [],
        creator: User.empty(),
        creator_id: '',
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
