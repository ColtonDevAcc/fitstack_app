// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'height_log_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HeightLogCWProxy {
  HeightLog created_at(DateTime created_at);

  HeightLog height(double height);

  HeightLog id(int id);

  HeightLog updated_at(DateTime updated_at);

  HeightLog user_statistic_id(String user_statistic_id);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HeightLog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HeightLog(...).copyWith(id: 12, name: "My name")
  /// ````
  HeightLog call({
    DateTime? created_at,
    double? height,
    int? id,
    DateTime? updated_at,
    String? user_statistic_id,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHeightLog.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHeightLog.copyWith.fieldName(...)`
class _$HeightLogCWProxyImpl implements _$HeightLogCWProxy {
  final HeightLog _value;

  const _$HeightLogCWProxyImpl(this._value);

  @override
  HeightLog created_at(DateTime created_at) => this(created_at: created_at);

  @override
  HeightLog height(double height) => this(height: height);

  @override
  HeightLog id(int id) => this(id: id);

  @override
  HeightLog updated_at(DateTime updated_at) => this(updated_at: updated_at);

  @override
  HeightLog user_statistic_id(String user_statistic_id) =>
      this(user_statistic_id: user_statistic_id);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HeightLog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HeightLog(...).copyWith(id: 12, name: "My name")
  /// ````
  HeightLog call({
    Object? created_at = const $CopyWithPlaceholder(),
    Object? height = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? updated_at = const $CopyWithPlaceholder(),
    Object? user_statistic_id = const $CopyWithPlaceholder(),
  }) {
    return HeightLog(
      created_at:
          created_at == const $CopyWithPlaceholder() || created_at == null
              ? _value.created_at
              // ignore: cast_nullable_to_non_nullable
              : created_at as DateTime,
      height: height == const $CopyWithPlaceholder() || height == null
          ? _value.height
          // ignore: cast_nullable_to_non_nullable
          : height as double,
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

extension $HeightLogCopyWith on HeightLog {
  /// Returns a callable class that can be used as follows: `instanceOfHeightLog.copyWith(...)` or like so:`instanceOfHeightLog.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HeightLogCWProxy get copyWith => _$HeightLogCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeightLog _$HeightLogFromJson(Map<String, dynamic> json) => HeightLog(
      user_statistic_id: json['user_statistic_id'] as String,
      height: (json['height'] as num).toDouble(),
      updated_at: DateTime.parse(json['updated_at'] as String),
      created_at: DateTime.parse(json['created_at'] as String),
      id: json['id'] as int,
    );

const _$HeightLogFieldMap = <String, String>{
  'id': 'id',
  'user_statistic_id': 'user_statistic_id',
  'height': 'height',
  'updated_at': 'updated_at',
  'created_at': 'created_at',
};

Map<String, dynamic> _$HeightLogToJson(HeightLog instance) => <String, dynamic>{
      'id': instance.id,
      'user_statistic_id': instance.user_statistic_id,
      'height': instance.height,
      'updated_at': instance.updated_at.toIso8601String(),
      'created_at': instance.created_at.toIso8601String(),
    };
