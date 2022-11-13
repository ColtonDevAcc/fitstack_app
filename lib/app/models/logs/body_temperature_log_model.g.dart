// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_temperature_log_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BodyTemperatureLogCWProxy {
  BodyTemperatureLog body_temperature(double body_temperature);

  BodyTemperatureLog created_at(DateTime? created_at);

  BodyTemperatureLog id(int? id);

  BodyTemperatureLog updated_at(DateTime? updated_at);

  BodyTemperatureLog user_statistic_id(String? user_statistic_id);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BodyTemperatureLog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BodyTemperatureLog(...).copyWith(id: 12, name: "My name")
  /// ````
  BodyTemperatureLog call({
    double? body_temperature,
    DateTime? created_at,
    int? id,
    DateTime? updated_at,
    String? user_statistic_id,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBodyTemperatureLog.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBodyTemperatureLog.copyWith.fieldName(...)`
class _$BodyTemperatureLogCWProxyImpl implements _$BodyTemperatureLogCWProxy {
  final BodyTemperatureLog _value;

  const _$BodyTemperatureLogCWProxyImpl(this._value);

  @override
  BodyTemperatureLog body_temperature(double body_temperature) =>
      this(body_temperature: body_temperature);

  @override
  BodyTemperatureLog created_at(DateTime? created_at) =>
      this(created_at: created_at);

  @override
  BodyTemperatureLog id(int? id) => this(id: id);

  @override
  BodyTemperatureLog updated_at(DateTime? updated_at) =>
      this(updated_at: updated_at);

  @override
  BodyTemperatureLog user_statistic_id(String? user_statistic_id) =>
      this(user_statistic_id: user_statistic_id);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BodyTemperatureLog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BodyTemperatureLog(...).copyWith(id: 12, name: "My name")
  /// ````
  BodyTemperatureLog call({
    Object? body_temperature = const $CopyWithPlaceholder(),
    Object? created_at = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? updated_at = const $CopyWithPlaceholder(),
    Object? user_statistic_id = const $CopyWithPlaceholder(),
  }) {
    return BodyTemperatureLog(
      body_temperature: body_temperature == const $CopyWithPlaceholder() ||
              body_temperature == null
          ? _value.body_temperature
          // ignore: cast_nullable_to_non_nullable
          : body_temperature as double,
      created_at: created_at == const $CopyWithPlaceholder()
          ? _value.created_at
          // ignore: cast_nullable_to_non_nullable
          : created_at as DateTime?,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      updated_at: updated_at == const $CopyWithPlaceholder()
          ? _value.updated_at
          // ignore: cast_nullable_to_non_nullable
          : updated_at as DateTime?,
      user_statistic_id: user_statistic_id == const $CopyWithPlaceholder()
          ? _value.user_statistic_id
          // ignore: cast_nullable_to_non_nullable
          : user_statistic_id as String?,
    );
  }
}

extension $BodyTemperatureLogCopyWith on BodyTemperatureLog {
  /// Returns a callable class that can be used as follows: `instanceOfBodyTemperatureLog.copyWith(...)` or like so:`instanceOfBodyTemperatureLog.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BodyTemperatureLogCWProxy get copyWith =>
      _$BodyTemperatureLogCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodyTemperatureLog _$BodyTemperatureLogFromJson(Map<String, dynamic> json) =>
    BodyTemperatureLog(
      id: json['id'] as int?,
      user_statistic_id: json['user_statistic_id'] as String?,
      body_temperature: (json['body_temperature'] as num).toDouble(),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

const _$BodyTemperatureLogFieldMap = <String, String>{
  'id': 'id',
  'user_statistic_id': 'user_statistic_id',
  'body_temperature': 'body_temperature',
  'updated_at': 'updated_at',
  'created_at': 'created_at',
};

Map<String, dynamic> _$BodyTemperatureLogToJson(BodyTemperatureLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_statistic_id': instance.user_statistic_id,
      'body_temperature': instance.body_temperature,
      'updated_at': instance.updated_at?.toIso8601String(),
      'created_at': instance.created_at?.toIso8601String(),
    };
