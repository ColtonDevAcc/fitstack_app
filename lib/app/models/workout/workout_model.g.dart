// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WorkoutCWProxy {
  Workout id(int? id);

  Workout name(String? name);

  Workout workout_sets(List<WorkoutSets>? workout_sets);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Workout(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Workout(...).copyWith(id: 12, name: "My name")
  /// ````
  Workout call({
    int? id,
    String? name,
    List<WorkoutSets>? workout_sets,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWorkout.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWorkout.copyWith.fieldName(...)`
class _$WorkoutCWProxyImpl implements _$WorkoutCWProxy {
  final Workout _value;

  const _$WorkoutCWProxyImpl(this._value);

  @override
  Workout id(int? id) => this(id: id);

  @override
  Workout name(String? name) => this(name: name);

  @override
  Workout workout_sets(List<WorkoutSets>? workout_sets) =>
      this(workout_sets: workout_sets);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Workout(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Workout(...).copyWith(id: 12, name: "My name")
  /// ````
  Workout call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? workout_sets = const $CopyWithPlaceholder(),
  }) {
    return Workout(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      workout_sets: workout_sets == const $CopyWithPlaceholder()
          ? _value.workout_sets
          // ignore: cast_nullable_to_non_nullable
          : workout_sets as List<WorkoutSets>?,
    );
  }
}

extension $WorkoutCopyWith on Workout {
  /// Returns a callable class that can be used as follows: `instanceOfWorkout.copyWith(...)` or like so:`instanceOfWorkout.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WorkoutCWProxy get copyWith => _$WorkoutCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Workout _$WorkoutFromJson(Map<String, dynamic> json) => Workout(
      id: json['id'] as int?,
      workout_sets: (json['workout_sets'] as List<dynamic>?)
          ?.map((e) => WorkoutSets.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
    );

const _$WorkoutFieldMap = <String, String>{
  'id': 'id',
  'name': 'name',
  'workout_sets': 'workout_sets',
};

Map<String, dynamic> _$WorkoutToJson(Workout instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'workout_sets': instance.workout_sets,
    };
