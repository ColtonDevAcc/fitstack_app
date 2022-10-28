// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RoutineCWProxy {
  Routine description(String? description);

  Routine id(int? id);

  Routine image_url(String? image_url);

  Routine schedule(RoutineSchedule? schedule);

  Routine title(String? title);

  Routine workouts(Workout? workouts);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Routine(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Routine(...).copyWith(id: 12, name: "My name")
  /// ````
  Routine call({
    String? description,
    int? id,
    String? image_url,
    RoutineSchedule? schedule,
    String? title,
    Workout? workouts,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRoutine.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRoutine.copyWith.fieldName(...)`
class _$RoutineCWProxyImpl implements _$RoutineCWProxy {
  final Routine _value;

  const _$RoutineCWProxyImpl(this._value);

  @override
  Routine description(String? description) => this(description: description);

  @override
  Routine id(int? id) => this(id: id);

  @override
  Routine image_url(String? image_url) => this(image_url: image_url);

  @override
  Routine schedule(RoutineSchedule? schedule) => this(schedule: schedule);

  @override
  Routine title(String? title) => this(title: title);

  @override
  Routine workouts(Workout? workouts) => this(workouts: workouts);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Routine(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Routine(...).copyWith(id: 12, name: "My name")
  /// ````
  Routine call({
    Object? description = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? image_url = const $CopyWithPlaceholder(),
    Object? schedule = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? workouts = const $CopyWithPlaceholder(),
  }) {
    return Routine(
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      image_url: image_url == const $CopyWithPlaceholder()
          ? _value.image_url
          // ignore: cast_nullable_to_non_nullable
          : image_url as String?,
      schedule: schedule == const $CopyWithPlaceholder()
          ? _value.schedule
          // ignore: cast_nullable_to_non_nullable
          : schedule as RoutineSchedule?,
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String?,
      workouts: workouts == const $CopyWithPlaceholder()
          ? _value.workouts
          // ignore: cast_nullable_to_non_nullable
          : workouts as Workout?,
    );
  }
}

extension $RoutineCopyWith on Routine {
  /// Returns a callable class that can be used as follows: `instanceOfRoutine.copyWith(...)` or like so:`instanceOfRoutine.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RoutineCWProxy get copyWith => _$RoutineCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Routine _$RoutineFromJson(Map<String, dynamic> json) => Routine(
      image_url: json['image_url'] as String?,
      schedule: json['schedule'] == null
          ? null
          : RoutineSchedule.fromJson(json['schedule'] as Map<String, dynamic>),
      workouts: json['workouts'] == null
          ? null
          : Workout.fromJson(json['workouts'] as Map<String, dynamic>),
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
    );

const _$RoutineFieldMap = <String, String>{
  'id': 'id',
  'title': 'title',
  'description': 'description',
  'image_url': 'image_url',
  'schedule': 'schedule',
  'workouts': 'workouts',
};

Map<String, dynamic> _$RoutineToJson(Routine instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image_url': instance.image_url,
      'schedule': instance.schedule,
      'workouts': instance.workouts,
    };
