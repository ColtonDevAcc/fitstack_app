// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WorkoutCWProxy {
  Workout creator(User? creator);

  Workout creator_id(String? creator_id);

  Workout description(String? description);

  Workout id(int? id);

  Workout title(String? title);

  Workout workout_sets(List<WorkoutSets>? workout_sets);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Workout(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Workout(...).copyWith(id: 12, name: "My name")
  /// ````
  Workout call({
    User? creator,
    String? creator_id,
    String? description,
    int? id,
    String? title,
    List<WorkoutSets>? workout_sets,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWorkout.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWorkout.copyWith.fieldName(...)`
class _$WorkoutCWProxyImpl implements _$WorkoutCWProxy {
  final Workout _value;

  const _$WorkoutCWProxyImpl(this._value);

  @override
  Workout creator(User? creator) => this(creator: creator);

  @override
  Workout creator_id(String? creator_id) => this(creator_id: creator_id);

  @override
  Workout description(String? description) => this(description: description);

  @override
  Workout id(int? id) => this(id: id);

  @override
  Workout title(String? title) => this(title: title);

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
    Object? creator = const $CopyWithPlaceholder(),
    Object? creator_id = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? workout_sets = const $CopyWithPlaceholder(),
  }) {
    return Workout(
      creator: creator == const $CopyWithPlaceholder()
          ? _value.creator
          // ignore: cast_nullable_to_non_nullable
          : creator as User?,
      creator_id: creator_id == const $CopyWithPlaceholder()
          ? _value.creator_id
          // ignore: cast_nullable_to_non_nullable
          : creator_id as String?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String?,
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
      creator_id: json['creator_id'] as String?,
      creator: json['creator'] == null
          ? null
          : User.fromJson(json['creator'] as Map<String, dynamic>),
      description: json['description'] as String?,
      id: json['id'] as int?,
      workout_sets: (json['workout_sets'] as List<dynamic>?)
          ?.map((e) => WorkoutSets.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String?,
    );

const _$WorkoutFieldMap = <String, String>{
  'id': 'id',
  'title': 'title',
  'description': 'description',
  'creator': 'creator',
  'creator_id': 'creator_id',
  'workout_sets': 'workout_sets',
};

Map<String, dynamic> _$WorkoutToJson(Workout instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'creator': instance.creator,
      'creator_id': instance.creator_id,
      'workout_sets': instance.workout_sets,
    };
