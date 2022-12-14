// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Routine _$RoutineFromJson(Map json) => Routine(
      imageUrl: json['image_url'] as String?,
      schedule: json['schedule'] == null
          ? null
          : RoutineSchedule.fromJson(
              Map<String, dynamic>.from(json['schedule'] as Map)),
      workouts: json['workouts'] == null
          ? null
          : Workout.fromJson(
              Map<String, dynamic>.from(json['workouts'] as Map)),
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
    );

const _$RoutineFieldMap = <String, String>{
  'id': 'id',
  'title': 'title',
  'description': 'description',
  'imageUrl': 'image_url',
  'schedule': 'schedule',
  'workouts': 'workouts',
};

Map<String, dynamic> _$RoutineToJson(Routine instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'schedule': instance.schedule?.toJson(),
      'workouts': instance.workouts?.toJson(),
    };
