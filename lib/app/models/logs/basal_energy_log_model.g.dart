// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basal_energy_log_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BasalEnergyLogCWProxy {
  BasalEnergyLog basal_energy(double basal_energy);

  BasalEnergyLog created_at(DateTime created_at);

  BasalEnergyLog id(int? id);

  BasalEnergyLog updated_at(DateTime? updated_at);

  BasalEnergyLog user_statistic_id(String? user_statistic_id);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BasalEnergyLog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BasalEnergyLog(...).copyWith(id: 12, name: "My name")
  /// ````
  BasalEnergyLog call({
    double? basal_energy,
    DateTime? created_at,
    int? id,
    DateTime? updated_at,
    String? user_statistic_id,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBasalEnergyLog.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBasalEnergyLog.copyWith.fieldName(...)`
class _$BasalEnergyLogCWProxyImpl implements _$BasalEnergyLogCWProxy {
  final BasalEnergyLog _value;

  const _$BasalEnergyLogCWProxyImpl(this._value);

  @override
  BasalEnergyLog basal_energy(double basal_energy) =>
      this(basal_energy: basal_energy);

  @override
  BasalEnergyLog created_at(DateTime created_at) =>
      this(created_at: created_at);

  @override
  BasalEnergyLog id(int? id) => this(id: id);

  @override
  BasalEnergyLog updated_at(DateTime? updated_at) =>
      this(updated_at: updated_at);

  @override
  BasalEnergyLog user_statistic_id(String? user_statistic_id) =>
      this(user_statistic_id: user_statistic_id);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BasalEnergyLog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BasalEnergyLog(...).copyWith(id: 12, name: "My name")
  /// ````
  BasalEnergyLog call({
    Object? basal_energy = const $CopyWithPlaceholder(),
    Object? created_at = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? updated_at = const $CopyWithPlaceholder(),
    Object? user_statistic_id = const $CopyWithPlaceholder(),
  }) {
    return BasalEnergyLog(
      basal_energy:
          basal_energy == const $CopyWithPlaceholder() || basal_energy == null
              ? _value.basal_energy
              // ignore: cast_nullable_to_non_nullable
              : basal_energy as double,
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

extension $BasalEnergyLogCopyWith on BasalEnergyLog {
  /// Returns a callable class that can be used as follows: `instanceOfBasalEnergyLog.copyWith(...)` or like so:`instanceOfBasalEnergyLog.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BasalEnergyLogCWProxy get copyWith => _$BasalEnergyLogCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasalEnergyLog _$BasalEnergyLogFromJson(Map<String, dynamic> json) =>
    BasalEnergyLog(
      id: json['id'] as int?,
      user_statistic_id: json['user_statistic_id'] as String?,
      basal_energy: (json['basal_energy'] as num).toDouble(),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      created_at: DateTime.parse(json['created_at'] as String),
    );

const _$BasalEnergyLogFieldMap = <String, String>{
  'id': 'id',
  'user_statistic_id': 'user_statistic_id',
  'basal_energy': 'basal_energy',
  'updated_at': 'updated_at',
  'created_at': 'created_at',
};

Map<String, dynamic> _$BasalEnergyLogToJson(BasalEnergyLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_statistic_id': instance.user_statistic_id,
      'basal_energy': instance.basal_energy,
      'updated_at': instance.updated_at?.toIso8601String(),
      'created_at': instance.created_at.toIso8601String(),
    };
