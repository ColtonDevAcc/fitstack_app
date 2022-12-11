import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'routine_schedule_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true, anyMap: true)
@CopyWith()
class RoutineSchedule extends Equatable {
  final int id;
  final DateTime? start_date;
  final DateTime? end_date;

  RoutineSchedule({
    required this.start_date,
    required this.end_date,
    required this.id,
  });

  @override
  List<Object?> get props => [];

  factory RoutineSchedule.fromJson(Map<String, dynamic> json) => _$RoutineScheduleFromJson(json);
  Map<String, dynamic> toJson() => _$RoutineScheduleToJson(this);
  factory RoutineSchedule.empty() => RoutineSchedule(end_date: null, id: 0, start_date: null);
}

//  ID        *int       `json:"id" db:"id"`
// 	StartDate *time.Time `json:"start_date" db:"start_date"`
// 	EndDate   *time.Time `json:"end_date" db:"end_date"`