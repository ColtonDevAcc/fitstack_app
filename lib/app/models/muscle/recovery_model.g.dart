// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recovery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recovery _$RecoveryFromJson(Map json) => Recovery(
      id: json['id'] as String?,
      muscles: (json['muscles'] as List<dynamic>)
          .map((e) => Muscle.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

const _$RecoveryFieldMap = <String, String>{
  'id': 'id',
  'muscles': 'muscles',
  'updatedAt': 'updated_at',
  'createdAt': 'created_at',
};

Map<String, dynamic> _$RecoveryToJson(Recovery instance) => <String, dynamic>{
      'id': instance.id,
      'muscles': instance.muscles.map((e) => e.toJson()).toList(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
    };
