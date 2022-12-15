// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutineSchedule _$RoutineScheduleFromJson(Map json) => RoutineSchedule(
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      id: json['id'] as int,
    );

const _$RoutineScheduleFieldMap = <String, String>{
  'id': 'id',
  'startDate': 'start_date',
  'endDate': 'end_date',
};

Map<String, dynamic> _$RoutineScheduleToJson(RoutineSchedule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start_date': instance.startDate?.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
    };
