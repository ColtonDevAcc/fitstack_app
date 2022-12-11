import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'exercise_equipment_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true, anyMap: true)
@CopyWith()
class ExerciseEquipment extends Equatable {
  final String id;

  ExerciseEquipment({
    required this.id,
  });

  @override
  List<Object?> get props => [id];

  factory ExerciseEquipment.fromJson(Map<String, dynamic> json) => _$ExerciseEquipmentFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseEquipmentToJson(this);
  factory ExerciseEquipment.empty() => ExerciseEquipment(
        id: '',
      );
}
