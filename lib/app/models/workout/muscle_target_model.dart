import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'muscle_target_model.g.dart';

@JsonSerializable()
@CopyWith()
class MuscleTarget extends Equatable {
  final String id;
  final String name;
  final String? description;
  final String? image;

  MuscleTarget({
    this.image,
    this.description,
    required this.name,
    required this.id,
  });

  @override
  List<Object?> get props => [id];

  factory MuscleTarget.fromJson(Map<String, dynamic> json) => _$MuscleTargetFromJson(json);
  Map<String, dynamic> toJson() => _$MuscleTargetToJson(this);
  factory MuscleTarget.empty() => MuscleTarget(id: '', description: '', name: '');
}
