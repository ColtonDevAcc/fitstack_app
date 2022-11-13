// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_energy_log_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ActiveEnergyLogCWProxy {
  ActiveEnergyLog active_energy(double active_energy);

  ActiveEnergyLog created_at(DateTime? created_at);

  ActiveEnergyLog id(int? id);

  ActiveEnergyLog updated_at(DateTime? updated_at);

  ActiveEnergyLog user_statistic_id(String? user_statistic_id);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ActiveEnergyLog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ActiveEnergyLog(...).copyWith(id: 12, name: "My name")
  /// ````
  ActiveEnergyLog call({
    double? active_energy,
    DateTime? created_at,
    int? id,
    DateTime? updated_at,
    String? user_statistic_id,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfActiveEnergyLog.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfActiveEnergyLog.copyWith.fieldName(...)`
class _$ActiveEnergyLogCWProxyImpl implements _$ActiveEnergyLogCWProxy {
  final ActiveEnergyLog _value;

  const _$ActiveEnergyLogCWProxyImpl(this._value);

  @override
  ActiveEnergyLog active_energy(double active_energy) =>
      this(active_energy: active_energy);

  @override
  ActiveEnergyLog created_at(DateTime? created_at) =>
      this(created_at: created_at);

  @override
  ActiveEnergyLog id(int? id) => this(id: id);

  @override
  ActiveEnergyLog updated_at(DateTime? updated_at) =>
      this(updated_at: updated_at);

  @override
  ActiveEnergyLog user_statistic_id(String? user_statistic_id) =>
      this(user_statistic_id: user_statistic_id);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ActiveEnergyLog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ActiveEnergyLog(...).copyWith(id: 12, name: "My name")
  /// ````
  ActiveEnergyLog call({
    Object? active_energy = const $CopyWithPlaceholder(),
    Object? created_at = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? updated_at = const $CopyWithPlaceholder(),
    Object? user_statistic_id = const $CopyWithPlaceholder(),
  }) {
    return ActiveEnergyLog(
      active_energy:
          active_energy == const $CopyWithPlaceholder() || active_energy == null
              ? _value.active_energy
              // ignore: cast_nullable_to_non_nullable
              : active_energy as double,
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

extension $ActiveEnergyLogCopyWith on ActiveEnergyLog {
  /// Returns a callable class that can be used as follows: `instanceOfActiveEnergyLog.copyWith(...)` or like so:`instanceOfActiveEnergyLog.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ActiveEnergyLogCWProxy get copyWith => _$ActiveEnergyLogCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveEnergyLog _$ActiveEnergyLogFromJson(Map<String, dynamic> json) =>
    ActiveEnergyLog(
      id: json['id'] as int?,
      user_statistic_id: json['user_statistic_id'] as String?,
      active_energy: (json['active_energy'] as num).toDouble(),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

const _$ActiveEnergyLogFieldMap = <String, String>{
  'id': 'id',
  'user_statistic_id': 'user_statistic_id',
  'active_energy': 'active_energy',
  'updated_at': 'updated_at',
  'created_at': 'created_at',
};

Map<String, dynamic> _$ActiveEnergyLogToJson(ActiveEnergyLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_statistic_id': instance.user_statistic_id,
      'active_energy': instance.active_energy,
      'updated_at': instance.updated_at?.toIso8601String(),
      'created_at': instance.created_at?.toIso8601String(),
    };
