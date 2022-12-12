// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_fat_log_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BodyFatPercentageLogCWProxy {
  BodyFatPercentageLog id(int? id);

  BodyFatPercentageLog createdAt(DateTime? createdAt);

  BodyFatPercentageLog updatedAt(DateTime? updatedAt);

  BodyFatPercentageLog userId(String? userId);

  BodyFatPercentageLog type(HealthDataType? type);

  BodyFatPercentageLog value(num? value);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BodyFatPercentageLog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BodyFatPercentageLog(...).copyWith(id: 12, name: "My name")
  /// ````
  BodyFatPercentageLog call({
    int? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? userId,
    HealthDataType? type,
    num? value,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBodyFatPercentageLog.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBodyFatPercentageLog.copyWith.fieldName(...)`
class _$BodyFatPercentageLogCWProxyImpl
    implements _$BodyFatPercentageLogCWProxy {
  const _$BodyFatPercentageLogCWProxyImpl(this._value);

  final BodyFatPercentageLog _value;

  @override
  BodyFatPercentageLog id(int? id) => this(id: id);

  @override
  BodyFatPercentageLog createdAt(DateTime? createdAt) =>
      this(createdAt: createdAt);

  @override
  BodyFatPercentageLog updatedAt(DateTime? updatedAt) =>
      this(updatedAt: updatedAt);

  @override
  BodyFatPercentageLog userId(String? userId) => this(userId: userId);

  @override
  BodyFatPercentageLog type(HealthDataType? type) => this(type: type);

  @override
  BodyFatPercentageLog value(num? value) => this(value: value);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BodyFatPercentageLog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BodyFatPercentageLog(...).copyWith(id: 12, name: "My name")
  /// ````
  BodyFatPercentageLog call({
    Object? id = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
    Object? userId = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
  }) {
    return BodyFatPercentageLog(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime?,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime?,
      userId: userId == const $CopyWithPlaceholder()
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as String?,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as HealthDataType?,
      value: value == const $CopyWithPlaceholder()
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as num?,
    );
  }
}

extension $BodyFatPercentageLogCopyWith on BodyFatPercentageLog {
  /// Returns a callable class that can be used as follows: `instanceOfBodyFatPercentageLog.copyWith(...)` or like so:`instanceOfBodyFatPercentageLog.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BodyFatPercentageLogCWProxy get copyWith =>
      _$BodyFatPercentageLogCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodyFatPercentageLog _$BodyFatPercentageLogFromJson(Map json) =>
    BodyFatPercentageLog(
      id: json['id'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      userId: json['user_id'] as String?,
      type: $enumDecodeNullable(_$HealthDataTypeEnumMap, json['type']),
      value: json['value'] as num?,
    );

const _$BodyFatPercentageLogFieldMap = <String, String>{
  'type': 'type',
  'value': 'value',
  'createdAt': 'created_at',
  'id': 'id',
  'userId': 'user_id',
  'updatedAt': 'updated_at',
};

Map<String, dynamic> _$BodyFatPercentageLogToJson(
        BodyFatPercentageLog instance) =>
    <String, dynamic>{
      'type': _$HealthDataTypeEnumMap[instance.type]!,
      'value': instance.value,
      'created_at': instance.createdAt.toIso8601String(),
      'id': instance.id,
      'user_id': instance.userId,
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

const _$HealthDataTypeEnumMap = {
  HealthDataType.ACTIVE_ENERGY_BURNED: 'ACTIVE_ENERGY_BURNED',
  HealthDataType.AUDIOGRAM: 'AUDIOGRAM',
  HealthDataType.BASAL_ENERGY_BURNED: 'BASAL_ENERGY_BURNED',
  HealthDataType.BLOOD_GLUCOSE: 'BLOOD_GLUCOSE',
  HealthDataType.BLOOD_OXYGEN: 'BLOOD_OXYGEN',
  HealthDataType.BLOOD_PRESSURE_DIASTOLIC: 'BLOOD_PRESSURE_DIASTOLIC',
  HealthDataType.BLOOD_PRESSURE_SYSTOLIC: 'BLOOD_PRESSURE_SYSTOLIC',
  HealthDataType.BODY_FAT_PERCENTAGE: 'BODY_FAT_PERCENTAGE',
  HealthDataType.BODY_MASS_INDEX: 'BODY_MASS_INDEX',
  HealthDataType.BODY_TEMPERATURE: 'BODY_TEMPERATURE',
  HealthDataType.DIETARY_CARBS_CONSUMED: 'DIETARY_CARBS_CONSUMED',
  HealthDataType.DIETARY_ENERGY_CONSUMED: 'DIETARY_ENERGY_CONSUMED',
  HealthDataType.DIETARY_FATS_CONSUMED: 'DIETARY_FATS_CONSUMED',
  HealthDataType.DIETARY_PROTEIN_CONSUMED: 'DIETARY_PROTEIN_CONSUMED',
  HealthDataType.FORCED_EXPIRATORY_VOLUME: 'FORCED_EXPIRATORY_VOLUME',
  HealthDataType.HEART_RATE: 'HEART_RATE',
  HealthDataType.HEART_RATE_VARIABILITY_SDNN: 'HEART_RATE_VARIABILITY_SDNN',
  HealthDataType.HEIGHT: 'HEIGHT',
  HealthDataType.RESTING_HEART_RATE: 'RESTING_HEART_RATE',
  HealthDataType.STEPS: 'STEPS',
  HealthDataType.WAIST_CIRCUMFERENCE: 'WAIST_CIRCUMFERENCE',
  HealthDataType.WALKING_HEART_RATE: 'WALKING_HEART_RATE',
  HealthDataType.WEIGHT: 'WEIGHT',
  HealthDataType.DISTANCE_WALKING_RUNNING: 'DISTANCE_WALKING_RUNNING',
  HealthDataType.FLIGHTS_CLIMBED: 'FLIGHTS_CLIMBED',
  HealthDataType.MOVE_MINUTES: 'MOVE_MINUTES',
  HealthDataType.DISTANCE_DELTA: 'DISTANCE_DELTA',
  HealthDataType.MINDFULNESS: 'MINDFULNESS',
  HealthDataType.WATER: 'WATER',
  HealthDataType.SLEEP_IN_BED: 'SLEEP_IN_BED',
  HealthDataType.SLEEP_ASLEEP: 'SLEEP_ASLEEP',
  HealthDataType.SLEEP_AWAKE: 'SLEEP_AWAKE',
  HealthDataType.EXERCISE_TIME: 'EXERCISE_TIME',
  HealthDataType.WORKOUT: 'WORKOUT',
  HealthDataType.HEADACHE_NOT_PRESENT: 'HEADACHE_NOT_PRESENT',
  HealthDataType.HEADACHE_MILD: 'HEADACHE_MILD',
  HealthDataType.HEADACHE_MODERATE: 'HEADACHE_MODERATE',
  HealthDataType.HEADACHE_SEVERE: 'HEADACHE_SEVERE',
  HealthDataType.HEADACHE_UNSPECIFIED: 'HEADACHE_UNSPECIFIED',
  HealthDataType.HIGH_HEART_RATE_EVENT: 'HIGH_HEART_RATE_EVENT',
  HealthDataType.LOW_HEART_RATE_EVENT: 'LOW_HEART_RATE_EVENT',
  HealthDataType.IRREGULAR_HEART_RATE_EVENT: 'IRREGULAR_HEART_RATE_EVENT',
  HealthDataType.ELECTRODERMAL_ACTIVITY: 'ELECTRODERMAL_ACTIVITY',
  HealthDataType.ELECTROCARDIOGRAM: 'ELECTROCARDIOGRAM',
};
