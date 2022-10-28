import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'exercise_type_model.g.dart';

@JsonSerializable()
@CopyWith()
class ExerciseType extends Equatable {
  final String id;

  ExerciseType({
    required this.id,
  });

  @override
  List<Object?> get props => [id];

  factory ExerciseType.fromJson(Map<String, dynamic> json) => _$ExerciseTypeFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseTypeToJson(this);
  factory ExerciseType.empty() => ExerciseType(id: '');
}
