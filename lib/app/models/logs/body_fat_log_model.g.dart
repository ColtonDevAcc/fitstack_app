// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_fat_log_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BodyFatLogCWProxy {
  BodyFatLog body_fat(double body_fat);

  BodyFatLog created_at(DateTime created_at);

  BodyFatLog id(int id);

  BodyFatLog updated_at(DateTime updated_at);

  BodyFatLog user_statistic_id(String user_statistic_id);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BodyFatLog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BodyFatLog(...).copyWith(id: 12, name: "My name")
  /// ````
  BodyFatLog call({
    double? body_fat,
    DateTime? created_at,
    int? id,
    DateTime? updated_at,
    String? user_statistic_id,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBodyFatLog.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBodyFatLog.copyWith.fieldName(...)`
class _$BodyFatLogCWProxyImpl implements _$BodyFatLogCWProxy {
  final BodyFatLog _value;

  const _$BodyFatLogCWProxyImpl(this._value);

  @override
  BodyFatLog body_fat(double body_fat) => this(body_fat: body_fat);

  @override
  BodyFatLog created_at(DateTime created_at) => this(created_at: created_at);

  @override
  BodyFatLog id(int id) => this(id: id);

  @override
  BodyFatLog updated_at(DateTime updated_at) => this(updated_at: updated_at);

  @override
  BodyFatLog user_statistic_id(String user_statistic_id) =>
      this(user_statistic_id: user_statistic_id);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BodyFatLog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BodyFatLog(...).copyWith(id: 12, name: "My name")
  /// ````
  BodyFatLog call({
    Object? body_fat = const $CopyWithPlaceholder(),
    Object? created_at = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? updated_at = const $CopyWithPlaceholder(),
    Object? user_statistic_id = const $CopyWithPlaceholder(),
  }) {
    return BodyFatLog(
      body_fat: body_fat == const $CopyWithPlaceholder() || body_fat == null
          ? _value.body_fat
          // ignore: cast_nullable_to_non_nullable
          : body_fat as double,
      created_at:
          created_at == const $CopyWithPlaceholder() || created_at == null
              ? _value.created_at
              // ignore: cast_nullable_to_non_nullable
              : created_at as DateTime,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int,
      updated_at:
          updated_at == const $CopyWithPlaceholder() || updated_at == null
              ? _value.updated_at
              // ignore: cast_nullable_to_non_nullable
              : updated_at as DateTime,
      user_statistic_id: user_statistic_id == const $CopyWithPlaceholder() ||
              user_statistic_id == null
          ? _value.user_statistic_id
          // ignore: cast_nullable_to_non_nullable
          : user_statistic_id as String,
    );
  }
}

extension $BodyFatLogCopyWith on BodyFatLog {
  /// Returns a callable class that can be used as follows: `instanceOfBodyFatLog.copyWith(...)` or like so:`instanceOfBodyFatLog.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BodyFatLogCWProxy get copyWith => _$BodyFatLogCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodyFatLog _$BodyFatLogFromJson(Map<String, dynamic> json) => BodyFatLog(
      user_statistic_id: json['user_statistic_id'] as String,
      body_fat: (json['body_fat'] as num).toDouble(),
      updated_at: DateTime.parse(json['updated_at'] as String),
      created_at: DateTime.parse(json['created_at'] as String),
      id: json['id'] as int,
    );

const _$BodyFatLogFieldMap = <String, String>{
  'id': 'id',
  'user_statistic_id': 'user_statistic_id',
  'body_fat': 'body_fat',
  'updated_at': 'updated_at',
  'created_at': 'created_at',
};

Map<String, dynamic> _$BodyFatLogToJson(BodyFatLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_statistic_id': instance.user_statistic_id,
      'body_fat': instance.body_fat,
      'updated_at': instance.updated_at.toIso8601String(),
      'created_at': instance.created_at.toIso8601String(),
    };
