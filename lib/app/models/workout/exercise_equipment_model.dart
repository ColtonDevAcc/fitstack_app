import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exercise_equipment_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true, anyMap: true)
class ExerciseEquipment extends Equatable {
  final String id;

  const ExerciseEquipment({
    required this.id,
  });

  @override
  List<Object?> get props => [id];

  factory ExerciseEquipment.fromJson(Map<String, dynamic> json) => _$ExerciseEquipmentFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseEquipmentToJson(this);
  factory ExerciseEquipment.empty() => const ExerciseEquipment(id: '');

  // copy with
  ExerciseEquipment copyWith({
    String? id,
  }) {
    return ExerciseEquipment(
      id: id ?? this.id,
    );
  }
}
