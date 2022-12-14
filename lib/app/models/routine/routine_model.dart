import 'package:FitStack/app/models/routine/routine_schedule_model.dart';
import 'package:FitStack/app/models/workout/workout_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'routine_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true, anyMap: true)
class Routine extends Equatable {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @JsonKey(name: 'schedule')
  final RoutineSchedule? schedule;
  @JsonKey(name: 'workouts')
  final Workout? workouts;

  const Routine({
    required this.imageUrl,
    required this.schedule,
    required this.workouts,
    required this.id,
    required this.title,
    required this.description,
  });

  @override
  List<Object?> get props => [id, title, description, imageUrl, schedule, workouts];

  factory Routine.fromJson(Map<String, dynamic> json) => _$RoutineFromJson(json);
  Map<String, dynamic> toJson() => _$RoutineToJson(this);
  factory Routine.empty() => const Routine(description: '', id: 0, imageUrl: '', schedule: null, title: '', workouts: null);

  Routine copyWith({
    int? id,
    String? title,
    String? description,
    String? imageUrl,
    RoutineSchedule? schedule,
    Workout? workouts,
  }) {
    return Routine(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      schedule: schedule ?? this.schedule,
      workouts: workouts ?? this.workouts,
    );
  }
}

//  ID          *int              `json:"id" db:"routine.id"`
// 	Title       *string           `json:"title" db:"routine.title"`
// 	Description *string           `json:"description" db:"routine.description"`
// 	ImageUrl    *string           `json:"image_url" db:"routine.image_url"`
// 	Schedule    *RoutineSchedule  `json:"schedule" db:"routine.schedule"`
// 	Workouts    *exercise.Workout `json:"workouts" db:""`
