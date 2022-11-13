// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'heart_rate_log_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HeartRateLogCWProxy {
  HeartRateLog created_at(DateTime created_at);

  HeartRateLog heart_rate(double heart_rate);

  HeartRateLog id(int? id);

  HeartRateLog updated_at(DateTime? updated_at);

  HeartRateLog user_statistic_id(String? user_statistic_id);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HeartRateLog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HeartRateLog(...).copyWith(id: 12, name: "My name")
  /// ````
  HeartRateLog call({
    DateTime? created_at,
    double? heart_rate,
    int? id,
    DateTime? updated_at,
    String? user_statistic_id,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHeartRateLog.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHeartRateLog.copyWith.fieldName(...)`
class _$HeartRateLogCWProxyImpl implements _$HeartRateLogCWProxy {
  final HeartRateLog _value;

  const _$HeartRateLogCWProxyImpl(this._value);

  @override
  HeartRateLog created_at(DateTime created_at) => this(created_at: created_at);

  @override
  HeartRateLog heart_rate(double heart_rate) => this(heart_rate: heart_rate);

  @override
  HeartRateLog id(int? id) => this(id: id);

  @override
  HeartRateLog updated_at(DateTime? updated_at) => this(updated_at: updated_at);

  @override
  HeartRateLog user_statistic_id(String? user_statistic_id) =>
      this(user_statistic_id: user_statistic_id);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HeartRateLog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HeartRateLog(...).copyWith(id: 12, name: "My name")
  /// ````
  HeartRateLog call({
    Object? created_at = const $CopyWithPlaceholder(),
    Object? heart_rate = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? updated_at = const $CopyWithPlaceholder(),
    Object? user_statistic_id = const $CopyWithPlaceholder(),
  }) {
    return HeartRateLog(
      created_at:
          created_at == const $CopyWithPlaceholder() || created_at == null
              ? _value.created_at
              // ignore: cast_nullable_to_non_nullable
              : created_at as DateTime,
      heart_rate:
          heart_rate == const $CopyWithPlaceholder() || heart_rate == null
              ? _value.heart_rate
              // ignore: cast_nullable_to_non_nullable
              : heart_rate as double,
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

extension $HeartRateLogCopyWith on HeartRateLog {
  /// Returns a callable class that can be used as follows: `instanceOfHeartRateLog.copyWith(...)` or like so:`instanceOfHeartRateLog.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HeartRateLogCWProxy get copyWith => _$HeartRateLogCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeartRateLog _$HeartRateLogFromJson(Map<String, dynamic> json) => HeartRateLog(
      id: json['id'] as int?,
      user_statistic_id: json['user_statistic_id'] as String?,
      heart_rate: (json['heart_rate'] as num).toDouble(),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      created_at: DateTime.parse(json['created_at'] as String),
    );

const _$HeartRateLogFieldMap = <String, String>{
  'id': 'id',
  'user_statistic_id': 'user_statistic_id',
  'heart_rate': 'heart_rate',
  'updated_at': 'updated_at',
  'created_at': 'created_at',
};

Map<String, dynamic> _$HeartRateLogToJson(HeartRateLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_statistic_id': instance.user_statistic_id,
      'heart_rate': instance.heart_rate,
      'updated_at': instance.updated_at?.toIso8601String(),
      'created_at': instance.created_at.toIso8601String(),
    };
