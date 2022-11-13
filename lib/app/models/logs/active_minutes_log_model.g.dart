// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_minutes_log_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ActiveMinutesLogCWProxy {
  ActiveMinutesLog active_minutes(double active_minutes);

  ActiveMinutesLog created_at(DateTime created_at);

  ActiveMinutesLog id(int? id);

  ActiveMinutesLog updated_at(DateTime? updated_at);

  ActiveMinutesLog user_statistic_id(String? user_statistic_id);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ActiveMinutesLog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ActiveMinutesLog(...).copyWith(id: 12, name: "My name")
  /// ````
  ActiveMinutesLog call({
    double? active_minutes,
    DateTime? created_at,
    int? id,
    DateTime? updated_at,
    String? user_statistic_id,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfActiveMinutesLog.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfActiveMinutesLog.copyWith.fieldName(...)`
class _$ActiveMinutesLogCWProxyImpl implements _$ActiveMinutesLogCWProxy {
  final ActiveMinutesLog _value;

  const _$ActiveMinutesLogCWProxyImpl(this._value);

  @override
  ActiveMinutesLog active_minutes(double active_minutes) =>
      this(active_minutes: active_minutes);

  @override
  ActiveMinutesLog created_at(DateTime created_at) =>
      this(created_at: created_at);

  @override
  ActiveMinutesLog id(int? id) => this(id: id);

  @override
  ActiveMinutesLog updated_at(DateTime? updated_at) =>
      this(updated_at: updated_at);

  @override
  ActiveMinutesLog user_statistic_id(String? user_statistic_id) =>
      this(user_statistic_id: user_statistic_id);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ActiveMinutesLog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ActiveMinutesLog(...).copyWith(id: 12, name: "My name")
  /// ````
  ActiveMinutesLog call({
    Object? active_minutes = const $CopyWithPlaceholder(),
    Object? created_at = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? updated_at = const $CopyWithPlaceholder(),
    Object? user_statistic_id = const $CopyWithPlaceholder(),
  }) {
    return ActiveMinutesLog(
      active_minutes: active_minutes == const $CopyWithPlaceholder() ||
              active_minutes == null
          ? _value.active_minutes
          // ignore: cast_nullable_to_non_nullable
          : active_minutes as double,
      created_at:
          created_at == const $CopyWithPlaceholder() || created_at == null
              ? _value.created_at
              // ignore: cast_nullable_to_non_nullable
              : created_at as DateTime,
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

extension $ActiveMinutesLogCopyWith on ActiveMinutesLog {
  /// Returns a callable class that can be used as follows: `instanceOfActiveMinutesLog.copyWith(...)` or like so:`instanceOfActiveMinutesLog.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ActiveMinutesLogCWProxy get copyWith => _$ActiveMinutesLogCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveMinutesLog _$ActiveMinutesLogFromJson(Map<String, dynamic> json) =>
    ActiveMinutesLog(
      id: json['id'] as int?,
      user_statistic_id: json['user_statistic_id'] as String?,
      active_minutes: (json['active_minutes'] as num).toDouble(),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      created_at: DateTime.parse(json['created_at'] as String),
    );

const _$ActiveMinutesLogFieldMap = <String, String>{
  'id': 'id',
  'user_statistic_id': 'user_statistic_id',
  'active_minutes': 'active_minutes',
  'updated_at': 'updated_at',
  'created_at': 'created_at',
};

Map<String, dynamic> _$ActiveMinutesLogToJson(ActiveMinutesLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_statistic_id': instance.user_statistic_id,
      'active_minutes': instance.active_minutes,
      'updated_at': instance.updated_at?.toIso8601String(),
      'created_at': instance.created_at.toIso8601String(),
    };
