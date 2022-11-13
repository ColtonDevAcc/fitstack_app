// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood_pressure_log_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BloodPressureLogCWProxy {
  BloodPressureLog created_at(DateTime created_at);

  BloodPressureLog diastolic(double? diastolic);

  BloodPressureLog id(int? id);

  BloodPressureLog systolic(double? systolic);

  BloodPressureLog updated_at(DateTime? updated_at);

  BloodPressureLog user_statistic_id(String? user_statistic_id);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BloodPressureLog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BloodPressureLog(...).copyWith(id: 12, name: "My name")
  /// ````
  BloodPressureLog call({
    DateTime? created_at,
    double? diastolic,
    int? id,
    double? systolic,
    DateTime? updated_at,
    String? user_statistic_id,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBloodPressureLog.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBloodPressureLog.copyWith.fieldName(...)`
class _$BloodPressureLogCWProxyImpl implements _$BloodPressureLogCWProxy {
  final BloodPressureLog _value;

  const _$BloodPressureLogCWProxyImpl(this._value);

  @override
  BloodPressureLog created_at(DateTime created_at) =>
      this(created_at: created_at);

  @override
  BloodPressureLog diastolic(double? diastolic) => this(diastolic: diastolic);

  @override
  BloodPressureLog id(int? id) => this(id: id);

  @override
  BloodPressureLog systolic(double? systolic) => this(systolic: systolic);

  @override
  BloodPressureLog updated_at(DateTime? updated_at) =>
      this(updated_at: updated_at);

  @override
  BloodPressureLog user_statistic_id(String? user_statistic_id) =>
      this(user_statistic_id: user_statistic_id);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BloodPressureLog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BloodPressureLog(...).copyWith(id: 12, name: "My name")
  /// ````
  BloodPressureLog call({
    Object? created_at = const $CopyWithPlaceholder(),
    Object? diastolic = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? systolic = const $CopyWithPlaceholder(),
    Object? updated_at = const $CopyWithPlaceholder(),
    Object? user_statistic_id = const $CopyWithPlaceholder(),
  }) {
    return BloodPressureLog(
      created_at:
          created_at == const $CopyWithPlaceholder() || created_at == null
              ? _value.created_at
              // ignore: cast_nullable_to_non_nullable
              : created_at as DateTime,
      diastolic: diastolic == const $CopyWithPlaceholder()
          ? _value.diastolic
          // ignore: cast_nullable_to_non_nullable
          : diastolic as double?,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      systolic: systolic == const $CopyWithPlaceholder()
          ? _value.systolic
          // ignore: cast_nullable_to_non_nullable
          : systolic as double?,
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

extension $BloodPressureLogCopyWith on BloodPressureLog {
  /// Returns a callable class that can be used as follows: `instanceOfBloodPressureLog.copyWith(...)` or like so:`instanceOfBloodPressureLog.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BloodPressureLogCWProxy get copyWith => _$BloodPressureLogCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BloodPressureLog _$BloodPressureLogFromJson(Map<String, dynamic> json) =>
    BloodPressureLog(
      id: json['id'] as int?,
      user_statistic_id: json['user_statistic_id'] as String?,
      systolic: (json['systolic'] as num?)?.toDouble(),
      diastolic: (json['diastolic'] as num?)?.toDouble(),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      created_at: DateTime.parse(json['created_at'] as String),
    );

const _$BloodPressureLogFieldMap = <String, String>{
  'id': 'id',
  'user_statistic_id': 'user_statistic_id',
  'systolic': 'systolic',
  'diastolic': 'diastolic',
  'updated_at': 'updated_at',
  'created_at': 'created_at',
};

Map<String, dynamic> _$BloodPressureLogToJson(BloodPressureLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_statistic_id': instance.user_statistic_id,
      'systolic': instance.systolic,
      'diastolic': instance.diastolic,
      'updated_at': instance.updated_at?.toIso8601String(),
      'created_at': instance.created_at.toIso8601String(),
    };
