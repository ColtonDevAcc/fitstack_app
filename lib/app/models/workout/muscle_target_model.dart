import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'muscle_target_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true, anyMap: true)
class MuscleTarget extends Equatable {
  final String id;
  final String name;
  final String? description;
  final String? image;

  const MuscleTarget({
    this.image,
    this.description,
    required this.name,
    required this.id,
  });

  @override
  List<Object?> get props => [id];

  factory MuscleTarget.fromJson(Map<String, dynamic> json) => _$MuscleTargetFromJson(json);
  Map<String, dynamic> toJson() => _$MuscleTargetToJson(this);
  factory MuscleTarget.empty() => const MuscleTarget(id: '', description: '', name: '');

  // copy with
  MuscleTarget copyWith({
    String? id,
    String? name,
    String? description,
    String? image,
  }) {
    return MuscleTarget(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }
}
