// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Workout _$WorkoutFromJson(Map json) => Workout(
      creatorId: json['creator_id'] as String?,
      creator: json['creator'] == null
          ? null
          : User.fromJson(Map<String, dynamic>.from(json['creator'] as Map)),
      description: json['description'] as String?,
      id: json['id'] as int?,
      workoutSets: (json['workout_sets'] as List<dynamic>?)
          ?.map(
              (e) => WorkoutSets.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      title: json['title'] as String?,
    );

const _$WorkoutFieldMap = <String, String>{
  'id': 'id',
  'title': 'title',
  'description': 'description',
  'creator': 'creator',
  'creatorId': 'creator_id',
  'workoutSets': 'workout_sets',
};

Map<String, dynamic> _$WorkoutToJson(Workout instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'creator': instance.creator?.toJson(),
      'creator_id': instance.creatorId,
      'workout_sets': instance.workoutSets?.map((e) => e.toJson()).toList(),
    };
