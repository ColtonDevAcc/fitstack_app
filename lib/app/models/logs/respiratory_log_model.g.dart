// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'respiratory_log_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RespiratoryLogCWProxy {
  RespiratoryLog created_at(DateTime? created_at);

  RespiratoryLog id(int id);

  RespiratoryLog respiratory(double respiratory);

  RespiratoryLog updated_at(DateTime? updated_at);

  RespiratoryLog user_statistic_id(String? user_statistic_id);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RespiratoryLog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RespiratoryLog(...).copyWith(id: 12, name: "My name")
  /// ````
  RespiratoryLog call({
    DateTime? created_at,
    int? id,
    double? respiratory,
    DateTime? updated_at,
    String? user_statistic_id,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRespiratoryLog.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRespiratoryLog.copyWith.fieldName(...)`
class _$RespiratoryLogCWProxyImpl implements _$RespiratoryLogCWProxy {
  final RespiratoryLog _value;

  const _$RespiratoryLogCWProxyImpl(this._value);

  @override
  RespiratoryLog created_at(DateTime? created_at) =>
      this(created_at: created_at);

  @override
  RespiratoryLog id(int id) => this(id: id);

  @override
  RespiratoryLog respiratory(double respiratory) =>
      this(respiratory: respiratory);

  @override
  RespiratoryLog updated_at(DateTime? updated_at) =>
      this(updated_at: updated_at);

  @override
  RespiratoryLog user_statistic_id(String? user_statistic_id) =>
      this(user_statistic_id: user_statistic_id);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RespiratoryLog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RespiratoryLog(...).copyWith(id: 12, name: "My name")
  /// ````
  RespiratoryLog call({
    Object? created_at = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? respiratory = const $CopyWithPlaceholder(),
    Object? updated_at = const $CopyWithPlaceholder(),
    Object? user_statistic_id = const $CopyWithPlaceholder(),
  }) {
    return RespiratoryLog(
      created_at: created_at == const $CopyWithPlaceholder()
          ? _value.created_at
          // ignore: cast_nullable_to_non_nullable
          : created_at as DateTime?,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int,
      respiratory:
          respiratory == const $CopyWithPlaceholder() || respiratory == null
              ? _value.respiratory
              // ignore: cast_nullable_to_non_nullable
              : respiratory as double,
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

extension $RespiratoryLogCopyWith on RespiratoryLog {
  /// Returns a callable class that can be used as follows: `instanceOfRespiratoryLog.copyWith(...)` or like so:`instanceOfRespiratoryLog.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RespiratoryLogCWProxy get copyWith => _$RespiratoryLogCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RespiratoryLog _$RespiratoryLogFromJson(Map<String, dynamic> json) =>
    RespiratoryLog(
      id: json['id'] as int,
      user_statistic_id: json['user_statistic_id'] as String?,
      respiratory: (json['respiratory'] as num).toDouble(),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

const _$RespiratoryLogFieldMap = <String, String>{
  'id': 'id',
  'user_statistic_id': 'user_statistic_id',
  'respiratory': 'respiratory',
  'updated_at': 'updated_at',
  'created_at': 'created_at',
};

Map<String, dynamic> _$RespiratoryLogToJson(RespiratoryLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_statistic_id': instance.user_statistic_id,
      'respiratory': instance.respiratory,
      'updated_at': instance.updated_at?.toIso8601String(),
      'created_at': instance.created_at?.toIso8601String(),
    };
