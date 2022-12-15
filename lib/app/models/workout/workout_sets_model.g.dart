// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_sets_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutSets _$WorkoutSetsFromJson(Map json) => WorkoutSets(
      exercises: (json['exercises'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Exercise.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      id: json['id'] as int?,
    );

const _$WorkoutSetsFieldMap = <String, String>{
  'id': 'id',
  'exercises': 'exercises',
};

Map<String, dynamic> _$WorkoutSetsToJson(WorkoutSets instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exercises': instance.exercises?.map((e) => e?.toJson()).toList(),
    };
