// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleep_log_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SleepLogCWProxy {
  SleepLog created_at(DateTime created_at);

  SleepLog id(int? id);

  SleepLog sleep(double sleep);

  SleepLog updated_at(DateTime? updated_at);

  SleepLog user_statistic_id(String? user_statistic_id);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SleepLog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SleepLog(...).copyWith(id: 12, name: "My name")
  /// ````
  SleepLog call({
    DateTime? created_at,
    int? id,
    double? sleep,
    DateTime? updated_at,
    String? user_statistic_id,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSleepLog.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSleepLog.copyWith.fieldName(...)`
class _$SleepLogCWProxyImpl implements _$SleepLogCWProxy {
  final SleepLog _value;

  const _$SleepLogCWProxyImpl(this._value);

  @override
  SleepLog created_at(DateTime created_at) => this(created_at: created_at);

  @override
  SleepLog id(int? id) => this(id: id);

  @override
  SleepLog sleep(double sleep) => this(sleep: sleep);

  @override
  SleepLog updated_at(DateTime? updated_at) => this(updated_at: updated_at);

  @override
  SleepLog user_statistic_id(String? user_statistic_id) =>
      this(user_statistic_id: user_statistic_id);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SleepLog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SleepLog(...).copyWith(id: 12, name: "My name")
  /// ````
  SleepLog call({
    Object? created_at = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? sleep = const $CopyWithPlaceholder(),
    Object? updated_at = const $CopyWithPlaceholder(),
    Object? user_statistic_id = const $CopyWithPlaceholder(),
  }) {
    return SleepLog(
      created_at:
          created_at == const $CopyWithPlaceholder() || created_at == null
              ? _value.created_at
              // ignore: cast_nullable_to_non_nullable
              : created_at as DateTime,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      sleep: sleep == const $CopyWithPlaceholder() || sleep == null
          ? _value.sleep
          // ignore: cast_nullable_to_non_nullable
          : sleep as double,
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

extension $SleepLogCopyWith on SleepLog {
  /// Returns a callable class that can be used as follows: `instanceOfSleepLog.copyWith(...)` or like so:`instanceOfSleepLog.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SleepLogCWProxy get copyWith => _$SleepLogCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SleepLog _$SleepLogFromJson(Map<String, dynamic> json) => SleepLog(
      id: json['id'] as int?,
      user_statistic_id: json['user_statistic_id'] as String?,
      sleep: (json['sleep'] as num).toDouble(),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      created_at: DateTime.parse(json['created_at'] as String),
    );

const _$SleepLogFieldMap = <String, String>{
  'id': 'id',
  'user_statistic_id': 'user_statistic_id',
  'sleep': 'sleep',
  'updated_at': 'updated_at',
  'created_at': 'created_at',
};

Map<String, dynamic> _$SleepLogToJson(SleepLog instance) => <String, dynamic>{
      'id': instance.id,
      'user_statistic_id': instance.user_statistic_id,
      'sleep': instance.sleep,
      'updated_at': instance.updated_at?.toIso8601String(),
      'created_at': instance.created_at.toIso8601String(),
    };
