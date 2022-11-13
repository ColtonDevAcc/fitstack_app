// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distance_log_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DistanceLogCWProxy {
  DistanceLog created_at(DateTime created_at);

  DistanceLog distance(double distance);

  DistanceLog id(int? id);

  DistanceLog updated_at(DateTime? updated_at);

  DistanceLog user_statistic_id(String? user_statistic_id);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DistanceLog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DistanceLog(...).copyWith(id: 12, name: "My name")
  /// ````
  DistanceLog call({
    DateTime? created_at,
    double? distance,
    int? id,
    DateTime? updated_at,
    String? user_statistic_id,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDistanceLog.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDistanceLog.copyWith.fieldName(...)`
class _$DistanceLogCWProxyImpl implements _$DistanceLogCWProxy {
  final DistanceLog _value;

  const _$DistanceLogCWProxyImpl(this._value);

  @override
  DistanceLog created_at(DateTime created_at) => this(created_at: created_at);

  @override
  DistanceLog distance(double distance) => this(distance: distance);

  @override
  DistanceLog id(int? id) => this(id: id);

  @override
  DistanceLog updated_at(DateTime? updated_at) => this(updated_at: updated_at);

  @override
  DistanceLog user_statistic_id(String? user_statistic_id) =>
      this(user_statistic_id: user_statistic_id);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DistanceLog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DistanceLog(...).copyWith(id: 12, name: "My name")
  /// ````
  DistanceLog call({
    Object? created_at = const $CopyWithPlaceholder(),
    Object? distance = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? updated_at = const $CopyWithPlaceholder(),
    Object? user_statistic_id = const $CopyWithPlaceholder(),
  }) {
    return DistanceLog(
      created_at:
          created_at == const $CopyWithPlaceholder() || created_at == null
              ? _value.created_at
              // ignore: cast_nullable_to_non_nullable
              : created_at as DateTime,
      distance: distance == const $CopyWithPlaceholder() || distance == null
          ? _value.distance
          // ignore: cast_nullable_to_non_nullable
          : distance as double,
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

extension $DistanceLogCopyWith on DistanceLog {
  /// Returns a callable class that can be used as follows: `instanceOfDistanceLog.copyWith(...)` or like so:`instanceOfDistanceLog.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DistanceLogCWProxy get copyWith => _$DistanceLogCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DistanceLog _$DistanceLogFromJson(Map<String, dynamic> json) => DistanceLog(
      id: json['id'] as int?,
      user_statistic_id: json['user_statistic_id'] as String?,
      distance: (json['distance'] as num).toDouble(),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      created_at: DateTime.parse(json['created_at'] as String),
    );

const _$DistanceLogFieldMap = <String, String>{
  'id': 'id',
  'user_statistic_id': 'user_statistic_id',
  'distance': 'distance',
  'updated_at': 'updated_at',
  'created_at': 'created_at',
};

Map<String, dynamic> _$DistanceLogToJson(DistanceLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_statistic_id': instance.user_statistic_id,
      'distance': instance.distance,
      'updated_at': instance.updated_at?.toIso8601String(),
      'created_at': instance.created_at.toIso8601String(),
    };
