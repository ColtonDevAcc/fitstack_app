// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_statistic_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserStatisticCWProxy {
  UserStatistic bmi_log(List<BMILog>? bmi_log);

  UserStatistic body_fat_log(List<BodyFatLog>? body_fat_log);

  UserStatistic created_at(DateTime created_at);

  UserStatistic height_log(List<HeightLog>? height_log);

  UserStatistic id(String id);

  UserStatistic updated_at(DateTime updated_at);

  UserStatistic weight_log(List<WeightLog>? weight_log);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserStatistic(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserStatistic(...).copyWith(id: 12, name: "My name")
  /// ````
  UserStatistic call({
    List<BMILog>? bmi_log,
    List<BodyFatLog>? body_fat_log,
    DateTime? created_at,
    List<HeightLog>? height_log,
    String? id,
    DateTime? updated_at,
    List<WeightLog>? weight_log,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUserStatistic.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUserStatistic.copyWith.fieldName(...)`
class _$UserStatisticCWProxyImpl implements _$UserStatisticCWProxy {
  final UserStatistic _value;

  const _$UserStatisticCWProxyImpl(this._value);

  @override
  UserStatistic bmi_log(List<BMILog>? bmi_log) => this(bmi_log: bmi_log);

  @override
  UserStatistic body_fat_log(List<BodyFatLog>? body_fat_log) =>
      this(body_fat_log: body_fat_log);

  @override
  UserStatistic created_at(DateTime created_at) => this(created_at: created_at);

  @override
  UserStatistic height_log(List<HeightLog>? height_log) =>
      this(height_log: height_log);

  @override
  UserStatistic id(String id) => this(id: id);

  @override
  UserStatistic updated_at(DateTime updated_at) => this(updated_at: updated_at);

  @override
  UserStatistic weight_log(List<WeightLog>? weight_log) =>
      this(weight_log: weight_log);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserStatistic(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserStatistic(...).copyWith(id: 12, name: "My name")
  /// ````
  UserStatistic call({
    Object? bmi_log = const $CopyWithPlaceholder(),
    Object? body_fat_log = const $CopyWithPlaceholder(),
    Object? created_at = const $CopyWithPlaceholder(),
    Object? height_log = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? updated_at = const $CopyWithPlaceholder(),
    Object? weight_log = const $CopyWithPlaceholder(),
  }) {
    return UserStatistic(
      bmi_log: bmi_log == const $CopyWithPlaceholder()
          ? _value.bmi_log
          // ignore: cast_nullable_to_non_nullable
          : bmi_log as List<BMILog>?,
      body_fat_log: body_fat_log == const $CopyWithPlaceholder()
          ? _value.body_fat_log
          // ignore: cast_nullable_to_non_nullable
          : body_fat_log as List<BodyFatLog>?,
      created_at:
          created_at == const $CopyWithPlaceholder() || created_at == null
              ? _value.created_at
              // ignore: cast_nullable_to_non_nullable
              : created_at as DateTime,
      height_log: height_log == const $CopyWithPlaceholder()
          ? _value.height_log
          // ignore: cast_nullable_to_non_nullable
          : height_log as List<HeightLog>?,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      updated_at:
          updated_at == const $CopyWithPlaceholder() || updated_at == null
              ? _value.updated_at
              // ignore: cast_nullable_to_non_nullable
              : updated_at as DateTime,
      weight_log: weight_log == const $CopyWithPlaceholder()
          ? _value.weight_log
          // ignore: cast_nullable_to_non_nullable
          : weight_log as List<WeightLog>?,
    );
  }
}

extension $UserStatisticCopyWith on UserStatistic {
  /// Returns a callable class that can be used as follows: `instanceOfUserStatistic.copyWith(...)` or like so:`instanceOfUserStatistic.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UserStatisticCWProxy get copyWith => _$UserStatisticCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserStatistic _$UserStatisticFromJson(Map<String, dynamic> json) =>
    UserStatistic(
      height_log: (json['height_log'] as List<dynamic>?)
          ?.map((e) => HeightLog.fromJson(e as Map<String, dynamic>))
          .toList(),
      weight_log: (json['weight_log'] as List<dynamic>?)
          ?.map((e) => WeightLog.fromJson(e as Map<String, dynamic>))
          .toList(),
      bmi_log: (json['bmi_log'] as List<dynamic>?)
          ?.map((e) => BMILog.fromJson(e as Map<String, dynamic>))
          .toList(),
      body_fat_log: (json['body_fat_log'] as List<dynamic>?)
          ?.map((e) => BodyFatLog.fromJson(e as Map<String, dynamic>))
          .toList(),
      updated_at: DateTime.parse(json['updated_at'] as String),
      created_at: DateTime.parse(json['created_at'] as String),
      id: json['id'] as String,
    );

const _$UserStatisticFieldMap = <String, String>{
  'id': 'id',
  'height_log': 'height_log',
  'weight_log': 'weight_log',
  'bmi_log': 'bmi_log',
  'body_fat_log': 'body_fat_log',
  'updated_at': 'updated_at',
  'created_at': 'created_at',
};

Map<String, dynamic> _$UserStatisticToJson(UserStatistic instance) =>
    <String, dynamic>{
      'id': instance.id,
      'height_log': instance.height_log,
      'weight_log': instance.weight_log,
      'bmi_log': instance.bmi_log,
      'body_fat_log': instance.body_fat_log,
      'updated_at': instance.updated_at.toIso8601String(),
      'created_at': instance.created_at.toIso8601String(),
    };
