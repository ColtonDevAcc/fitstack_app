// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_schedule_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RoutineScheduleCWProxy {
  RoutineSchedule end_date(DateTime? end_date);

  RoutineSchedule id(int id);

  RoutineSchedule start_date(DateTime? start_date);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RoutineSchedule(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RoutineSchedule(...).copyWith(id: 12, name: "My name")
  /// ````
  RoutineSchedule call({
    DateTime? end_date,
    int? id,
    DateTime? start_date,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRoutineSchedule.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRoutineSchedule.copyWith.fieldName(...)`
class _$RoutineScheduleCWProxyImpl implements _$RoutineScheduleCWProxy {
  final RoutineSchedule _value;

  const _$RoutineScheduleCWProxyImpl(this._value);

  @override
  RoutineSchedule end_date(DateTime? end_date) => this(end_date: end_date);

  @override
  RoutineSchedule id(int id) => this(id: id);

  @override
  RoutineSchedule start_date(DateTime? start_date) =>
      this(start_date: start_date);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RoutineSchedule(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RoutineSchedule(...).copyWith(id: 12, name: "My name")
  /// ````
  RoutineSchedule call({
    Object? end_date = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? start_date = const $CopyWithPlaceholder(),
  }) {
    return RoutineSchedule(
      end_date: end_date == const $CopyWithPlaceholder()
          ? _value.end_date
          // ignore: cast_nullable_to_non_nullable
          : end_date as DateTime?,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int,
      start_date: start_date == const $CopyWithPlaceholder()
          ? _value.start_date
          // ignore: cast_nullable_to_non_nullable
          : start_date as DateTime?,
    );
  }
}

extension $RoutineScheduleCopyWith on RoutineSchedule {
  /// Returns a callable class that can be used as follows: `instanceOfRoutineSchedule.copyWith(...)` or like so:`instanceOfRoutineSchedule.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RoutineScheduleCWProxy get copyWith => _$RoutineScheduleCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutineSchedule _$RoutineScheduleFromJson(Map<String, dynamic> json) =>
    RoutineSchedule(
      start_date: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      end_date: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      id: json['id'] as int,
    );

const _$RoutineScheduleFieldMap = <String, String>{
  'id': 'id',
  'start_date': 'start_date',
  'end_date': 'end_date',
};

Map<String, dynamic> _$RoutineScheduleToJson(RoutineSchedule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start_date': instance.start_date?.toIso8601String(),
      'end_date': instance.end_date?.toIso8601String(),
    };
