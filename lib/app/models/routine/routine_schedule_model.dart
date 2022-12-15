import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'routine_schedule_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true, anyMap: true)
class RoutineSchedule extends Equatable {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'start_date')
  final DateTime? startDate;
  @JsonKey(name: 'end_date')
  final DateTime? endDate;

  const RoutineSchedule({
    required this.startDate,
    required this.endDate,
    required this.id,
  });

  @override
  List<Object?> get props => [];

  factory RoutineSchedule.fromJson(Map<String, dynamic> json) => _$RoutineScheduleFromJson(json);
  Map<String, dynamic> toJson() => _$RoutineScheduleToJson(this);
  factory RoutineSchedule.empty() => const RoutineSchedule(endDate: null, id: 0, startDate: null);

  RoutineSchedule copyWith({
    DateTime? startDate,
    DateTime? endDate,
    int? id,
  }) {
    return RoutineSchedule(
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      id: id ?? this.id,
    );
  }
}

//  ID        *int       `json:"id" db:"id"`
// 	StartDate *time.Time `json:"start_date" db:"start_date"`
// 	EndDate   *time.Time `json:"end_date" db:"end_date"`
