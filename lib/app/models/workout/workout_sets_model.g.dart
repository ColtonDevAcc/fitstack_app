// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_sets_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WorkoutSetsCWProxy {
  WorkoutSets exercises(List<Exercise?>? exercises);

  WorkoutSets id(int? id);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WorkoutSets(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WorkoutSets(...).copyWith(id: 12, name: "My name")
  /// ````
  WorkoutSets call({
    List<Exercise?>? exercises,
    int? id,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWorkoutSets.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWorkoutSets.copyWith.fieldName(...)`
class _$WorkoutSetsCWProxyImpl implements _$WorkoutSetsCWProxy {
  final WorkoutSets _value;

  const _$WorkoutSetsCWProxyImpl(this._value);

  @override
  WorkoutSets exercises(List<Exercise?>? exercises) =>
      this(exercises: exercises);

  @override
  WorkoutSets id(int? id) => this(id: id);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WorkoutSets(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WorkoutSets(...).copyWith(id: 12, name: "My name")
  /// ````
  WorkoutSets call({
    Object? exercises = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
  }) {
    return WorkoutSets(
      exercises: exercises == const $CopyWithPlaceholder()
          ? _value.exercises
          // ignore: cast_nullable_to_non_nullable
          : exercises as List<Exercise?>?,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
    );
  }
}

extension $WorkoutSetsCopyWith on WorkoutSets {
  /// Returns a callable class that can be used as follows: `instanceOfWorkoutSets.copyWith(...)` or like so:`instanceOfWorkoutSets.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WorkoutSetsCWProxy get copyWith => _$WorkoutSetsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutSets _$WorkoutSetsFromJson(Map<String, dynamic> json) => WorkoutSets(
      exercises: (json['exercises'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Exercise.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as int?,
    );

const _$WorkoutSetsFieldMap = <String, String>{
  'id': 'id',
  'exercises': 'exercises',
};

Map<String, dynamic> _$WorkoutSetsToJson(WorkoutSets instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exercises': instance.exercises,
    };
