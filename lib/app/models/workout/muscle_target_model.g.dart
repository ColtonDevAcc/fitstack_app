// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'muscle_target_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MuscleTarget _$MuscleTargetFromJson(Map json) => MuscleTarget(
      image: json['image'] as String?,
      description: json['description'] as String?,
      name: json['name'] as String,
      id: json['id'] as String,
    );

const _$MuscleTargetFieldMap = <String, String>{
  'id': 'id',
  'name': 'name',
  'description': 'description',
  'image': 'image',
};

Map<String, dynamic> _$MuscleTargetToJson(MuscleTarget instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
    };
