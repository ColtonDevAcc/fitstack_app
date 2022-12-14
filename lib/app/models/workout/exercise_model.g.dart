// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercise _$ExerciseFromJson(Map json) => Exercise(
      creatorId: json['creator_id'] as String,
      creator: User.fromJson(Map<String, dynamic>.from(json['creator'] as Map)),
      muscleTarget: (json['muscle_target'] as List<dynamic>?)
          ?.map(
              (e) => MuscleTarget.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      metValue: (json['met_value'] as num?)?.toDouble(),
      type: $enumDecodeNullable(_$ExerciseTypeEnumMap, json['type']),
      exerciseEquipment: (json['exercise_equipment'] as List<dynamic>?)
          ?.map((e) =>
              ExerciseEquipment.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      id: json['id'] as int?,
    );

const _$ExerciseFieldMap = <String, String>{
  'id': 'id',
  'name': 'name',
  'description': 'description',
  'images': 'images',
  'metValue': 'met_value',
  'creator': 'creator',
  'creatorId': 'creator_id',
  'type': 'type',
  'exerciseEquipment': 'exercise_equipment',
  'muscleTarget': 'muscle_target',
};

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'images': instance.images,
      'met_value': instance.metValue,
      'creator': instance.creator.toJson(),
      'creator_id': instance.creatorId,
      'type': _$ExerciseTypeEnumMap[instance.type],
      'exercise_equipment':
          instance.exerciseEquipment?.map((e) => e.toJson()).toList(),
      'muscle_target': instance.muscleTarget?.map((e) => e.toJson()).toList(),
    };

const _$ExerciseTypeEnumMap = {
  ExerciseType.push: 'push',
  ExerciseType.pull: 'pull',
  ExerciseType.legs: 'legs',
  ExerciseType.core: 'core',
  ExerciseType.cardio: 'cardio',
  ExerciseType.other: 'other',
};
