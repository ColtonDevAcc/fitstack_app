import 'package:FitStack/app/models/routine/routine_schedule_model.dart';
import 'package:FitStack/app/models/workout/workout_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'routine_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true, anyMap: true)
@CopyWith()
class Routine extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final String? image_url;
  final RoutineSchedule? schedule;
  final Workout? workouts;

  Routine({
    required this.image_url,
    required this.schedule,
    required this.workouts,
    required this.id,
    required this.title,
    required this.description,
  });

  @override
  List<Object?> get props => [id, title, description, image_url, schedule, workouts];

  factory Routine.fromJson(Map<String, dynamic> json) => _$RoutineFromJson(json);
  Map<String, dynamic> toJson() => _$RoutineToJson(this);
  factory Routine.empty() => Routine(description: '', id: 0, image_url: '', schedule: null, title: '', workouts: null);
}

//  ID          *int              `json:"id" db:"routine.id"`
// 	Title       *string           `json:"title" db:"routine.title"`
// 	Description *string           `json:"description" db:"routine.description"`
// 	ImageUrl    *string           `json:"image_url" db:"routine.image_url"`
// 	Schedule    *RoutineSchedule  `json:"schedule" db:"routine.schedule"`
// 	Workouts    *exercise.Workout `json:"workouts" db:""`