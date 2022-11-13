// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oxygen_saturation_log_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OxygenSaturationLogCWProxy {
  OxygenSaturationLog created_at(DateTime? created_at);

  OxygenSaturationLog id(int? id);

  OxygenSaturationLog oxygen_saturation(double oxygen_saturation);

  OxygenSaturationLog updated_at(DateTime? updated_at);

  OxygenSaturationLog user_statistic_id(String? user_statistic_id);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OxygenSaturationLog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OxygenSaturationLog(...).copyWith(id: 12, name: "My name")
  /// ````
  OxygenSaturationLog call({
    DateTime? created_at,
    int? id,
    double? oxygen_saturation,
    DateTime? updated_at,
    String? user_statistic_id,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOxygenSaturationLog.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOxygenSaturationLog.copyWith.fieldName(...)`
class _$OxygenSaturationLogCWProxyImpl implements _$OxygenSaturationLogCWProxy {
  final OxygenSaturationLog _value;

  const _$OxygenSaturationLogCWProxyImpl(this._value);

  @override
  OxygenSaturationLog created_at(DateTime? created_at) =>
      this(created_at: created_at);

  @override
  OxygenSaturationLog id(int? id) => this(id: id);

  @override
  OxygenSaturationLog oxygen_saturation(double oxygen_saturation) =>
      this(oxygen_saturation: oxygen_saturation);

  @override
  OxygenSaturationLog updated_at(DateTime? updated_at) =>
      this(updated_at: updated_at);

  @override
  OxygenSaturationLog user_statistic_id(String? user_statistic_id) =>
      this(user_statistic_id: user_statistic_id);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OxygenSaturationLog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OxygenSaturationLog(...).copyWith(id: 12, name: "My name")
  /// ````
  OxygenSaturationLog call({
    Object? created_at = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? oxygen_saturation = const $CopyWithPlaceholder(),
    Object? updated_at = const $CopyWithPlaceholder(),
    Object? user_statistic_id = const $CopyWithPlaceholder(),
  }) {
    return OxygenSaturationLog(
      created_at: created_at == const $CopyWithPlaceholder()
          ? _value.created_at
          // ignore: cast_nullable_to_non_nullable
          : created_at as DateTime?,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      oxygen_saturation: oxygen_saturation == const $CopyWithPlaceholder() ||
              oxygen_saturation == null
          ? _value.oxygen_saturation
          // ignore: cast_nullable_to_non_nullable
          : oxygen_saturation as double,
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

extension $OxygenSaturationLogCopyWith on OxygenSaturationLog {
  /// Returns a callable class that can be used as follows: `instanceOfOxygenSaturationLog.copyWith(...)` or like so:`instanceOfOxygenSaturationLog.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OxygenSaturationLogCWProxy get copyWith =>
      _$OxygenSaturationLogCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OxygenSaturationLog _$OxygenSaturationLogFromJson(Map<String, dynamic> json) =>
    OxygenSaturationLog(
      id: json['id'] as int?,
      user_statistic_id: json['user_statistic_id'] as String?,
      oxygen_saturation: (json['oxygen_saturation'] as num).toDouble(),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

const _$OxygenSaturationLogFieldMap = <String, String>{
  'id': 'id',
  'user_statistic_id': 'user_statistic_id',
  'oxygen_saturation': 'oxygen_saturation',
  'updated_at': 'updated_at',
  'created_at': 'created_at',
};

Map<String, dynamic> _$OxygenSaturationLogToJson(
        OxygenSaturationLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_statistic_id': instance.user_statistic_id,
      'oxygen_saturation': instance.oxygen_saturation,
      'updated_at': instance.updated_at?.toIso8601String(),
      'created_at': instance.created_at?.toIso8601String(),
    };
