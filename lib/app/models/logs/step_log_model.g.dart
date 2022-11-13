// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_log_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StepLogCWProxy {
  StepLog created_at(DateTime? created_at);

  StepLog id(int? id);

  StepLog step_count(int step_count);

  StepLog updated_at(DateTime? updated_at);

  StepLog user_statistic_id(String? user_statistic_id);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StepLog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StepLog(...).copyWith(id: 12, name: "My name")
  /// ````
  StepLog call({
    DateTime? created_at,
    int? id,
    int? step_count,
    DateTime? updated_at,
    String? user_statistic_id,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfStepLog.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfStepLog.copyWith.fieldName(...)`
class _$StepLogCWProxyImpl implements _$StepLogCWProxy {
  final StepLog _value;

  const _$StepLogCWProxyImpl(this._value);

  @override
  StepLog created_at(DateTime? created_at) => this(created_at: created_at);

  @override
  StepLog id(int? id) => this(id: id);

  @override
  StepLog step_count(int step_count) => this(step_count: step_count);

  @override
  StepLog updated_at(DateTime? updated_at) => this(updated_at: updated_at);

  @override
  StepLog user_statistic_id(String? user_statistic_id) =>
      this(user_statistic_id: user_statistic_id);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StepLog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StepLog(...).copyWith(id: 12, name: "My name")
  /// ````
  StepLog call({
    Object? created_at = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? step_count = const $CopyWithPlaceholder(),
    Object? updated_at = const $CopyWithPlaceholder(),
    Object? user_statistic_id = const $CopyWithPlaceholder(),
  }) {
    return StepLog(
      created_at: created_at == const $CopyWithPlaceholder()
          ? _value.created_at
          // ignore: cast_nullable_to_non_nullable
          : created_at as DateTime?,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      step_count:
          step_count == const $CopyWithPlaceholder() || step_count == null
              ? _value.step_count
              // ignore: cast_nullable_to_non_nullable
              : step_count as int,
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

extension $StepLogCopyWith on StepLog {
  /// Returns a callable class that can be used as follows: `instanceOfStepLog.copyWith(...)` or like so:`instanceOfStepLog.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$StepLogCWProxy get copyWith => _$StepLogCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StepLog _$StepLogFromJson(Map<String, dynamic> json) => StepLog(
      user_statistic_id: json['user_statistic_id'] as String?,
      step_count: json['step_count'] as int,
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      id: json['id'] as int?,
    );

const _$StepLogFieldMap = <String, String>{
  'id': 'id',
  'user_statistic_id': 'user_statistic_id',
  'step_count': 'step_count',
  'updated_at': 'updated_at',
  'created_at': 'created_at',
};

Map<String, dynamic> _$StepLogToJson(StepLog instance) => <String, dynamic>{
      'id': instance.id,
      'user_statistic_id': instance.user_statistic_id,
      'step_count': instance.step_count,
      'updated_at': instance.updated_at?.toIso8601String(),
      'created_at': instance.created_at?.toIso8601String(),
    };
