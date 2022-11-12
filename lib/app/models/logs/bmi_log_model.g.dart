// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bmi_log_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BMILogCWProxy {
  BMILog bmi(double bmi);

  BMILog created_at(DateTime? created_at);

  BMILog id(int? id);

  BMILog updated_at(DateTime? updated_at);

  BMILog user_statistic_id(String? user_statistic_id);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BMILog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BMILog(...).copyWith(id: 12, name: "My name")
  /// ````
  BMILog call({
    double? bmi,
    DateTime? created_at,
    int? id,
    DateTime? updated_at,
    String? user_statistic_id,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBMILog.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBMILog.copyWith.fieldName(...)`
class _$BMILogCWProxyImpl implements _$BMILogCWProxy {
  final BMILog _value;

  const _$BMILogCWProxyImpl(this._value);

  @override
  BMILog bmi(double bmi) => this(bmi: bmi);

  @override
  BMILog created_at(DateTime? created_at) => this(created_at: created_at);

  @override
  BMILog id(int? id) => this(id: id);

  @override
  BMILog updated_at(DateTime? updated_at) => this(updated_at: updated_at);

  @override
  BMILog user_statistic_id(String? user_statistic_id) =>
      this(user_statistic_id: user_statistic_id);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BMILog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BMILog(...).copyWith(id: 12, name: "My name")
  /// ````
  BMILog call({
    Object? bmi = const $CopyWithPlaceholder(),
    Object? created_at = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? updated_at = const $CopyWithPlaceholder(),
    Object? user_statistic_id = const $CopyWithPlaceholder(),
  }) {
    return BMILog(
      bmi: bmi == const $CopyWithPlaceholder() || bmi == null
          ? _value.bmi
          // ignore: cast_nullable_to_non_nullable
          : bmi as double,
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

extension $BMILogCopyWith on BMILog {
  /// Returns a callable class that can be used as follows: `instanceOfBMILog.copyWith(...)` or like so:`instanceOfBMILog.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BMILogCWProxy get copyWith => _$BMILogCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BMILog _$BMILogFromJson(Map<String, dynamic> json) => BMILog(
      user_statistic_id: json['user_statistic_id'] as String?,
      bmi: (json['bmi'] as num).toDouble(),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      id: json['id'] as int?,
    );

const _$BMILogFieldMap = <String, String>{
  'id': 'id',
  'user_statistic_id': 'user_statistic_id',
  'bmi': 'bmi',
  'updated_at': 'updated_at',
  'created_at': 'created_at',
};

Map<String, dynamic> _$BMILogToJson(BMILog instance) => <String, dynamic>{
      'id': instance.id,
      'user_statistic_id': instance.user_statistic_id,
      'bmi': instance.bmi,
      'updated_at': instance.updated_at?.toIso8601String(),
      'created_at': instance.created_at?.toIso8601String(),
    };
