import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'workout_model.g.dart';

@JsonSerializable()
@CopyWith()
class Workout extends Equatable {
  final String name;

  Workout({
    required this.name,
  });

  @override
  List<Object?> get props => [];

  factory Workout.fromJson(Map<String, dynamic> json) => _$WorkoutFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutToJson(this);
  factory Workout.empty() => Workout(name: '');
}
