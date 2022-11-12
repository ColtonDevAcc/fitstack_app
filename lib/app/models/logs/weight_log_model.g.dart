// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weight_log_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WeightLogCWProxy {
  WeightLog created_at(DateTime created_at);

  WeightLog id(int id);

  WeightLog updated_at(DateTime updated_at);

  WeightLog user_statistic_id(String user_statistic_id);

  WeightLog weight(double weight);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WeightLog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WeightLog(...).copyWith(id: 12, name: "My name")
  /// ````
  WeightLog call({
    DateTime? created_at,
    int? id,
    DateTime? updated_at,
    String? user_statistic_id,
    double? weight,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWeightLog.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWeightLog.copyWith.fieldName(...)`
class _$WeightLogCWProxyImpl implements _$WeightLogCWProxy {
  final WeightLog _value;

  const _$WeightLogCWProxyImpl(this._value);

  @override
  WeightLog created_at(DateTime created_at) => this(created_at: created_at);

  @override
  WeightLog id(int id) => this(id: id);

  @override
  WeightLog updated_at(DateTime updated_at) => this(updated_at: updated_at);

  @override
  WeightLog user_statistic_id(String user_statistic_id) =>
      this(user_statistic_id: user_statistic_id);

  @override
  WeightLog weight(double weight) => this(weight: weight);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WeightLog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WeightLog(...).copyWith(id: 12, name: "My name")
  /// ````
  WeightLog call({
    Object? created_at = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? updated_at = const $CopyWithPlaceholder(),
    Object? user_statistic_id = const $CopyWithPlaceholder(),
    Object? weight = const $CopyWithPlaceholder(),
  }) {
    return WeightLog(
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
      weight: weight == const $CopyWithPlaceholder() || weight == null
          ? _value.weight
          // ignore: cast_nullable_to_non_nullable
          : weight as double,
    );
  }
}

extension $WeightLogCopyWith on WeightLog {
  /// Returns a callable class that can be used as follows: `instanceOfWeightLog.copyWith(...)` or like so:`instanceOfWeightLog.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WeightLogCWProxy get copyWith => _$WeightLogCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeightLog _$WeightLogFromJson(Map<String, dynamic> json) => WeightLog(
      user_statistic_id: json['user_statistic_id'] as String,
      weight: (json['weight'] as num).toDouble(),
      updated_at: DateTime.parse(json['updated_at'] as String),
      created_at: DateTime.parse(json['created_at'] as String),
      id: json['id'] as int,
    );

const _$WeightLogFieldMap = <String, String>{
  'id': 'id',
  'user_statistic_id': 'user_statistic_id',
  'weight': 'weight',
  'updated_at': 'updated_at',
  'created_at': 'created_at',
};

Map<String, dynamic> _$WeightLogToJson(WeightLog instance) => <String, dynamic>{
      'id': instance.id,
      'user_statistic_id': instance.user_statistic_id,
      'weight': instance.weight,
      'updated_at': instance.updated_at.toIso8601String(),
      'created_at': instance.created_at.toIso8601String(),
    };
