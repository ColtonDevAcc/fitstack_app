import 'package:FitStack/app/models/workout/exercise_equipment_model.dart';
import 'package:FitStack/app/models/workout/exercise_type_model.dart';
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
  final String? image;
  final double? met_value;
  final ExerciseType? exercise_type;
  final ExerciseEquipment? exercise_equipment;
  final MuscleTarget? muscle_target;

  Exercise({
    required this.muscle_target,
    required this.name,
    required this.description,
    required this.image,
    required this.met_value,
    required this.exercise_type,
    required this.exercise_equipment,
    required this.id,
  });

  @override
  List<Object?> get props => [id, name, description, image, met_value, exercise_type, exercise_equipment, muscle_target];

  factory Exercise.fromJson(Map<String, dynamic> json) => _$ExerciseFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseToJson(this);
  factory Exercise.empty() => Exercise(
        id: 0,
        name: '',
        description: '',
        image: '',
        met_value: 0,
        exercise_type: ExerciseType(id: ''),
        exercise_equipment: ExerciseEquipment(id: ''),
        muscle_target: MuscleTarget(id: ''),
      );
}
