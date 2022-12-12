// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WorkoutCWProxy {
  Workout creator_id(String? creator_id);

  Workout creator(User? creator);

  Workout description(String? description);

  Workout id(int? id);

  Workout workout_sets(List<WorkoutSets>? workout_sets);

  Workout title(String? title);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Workout(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Workout(...).copyWith(id: 12, name: "My name")
  /// ````
  Workout call({
    String? creator_id,
    User? creator,
    String? description,
    int? id,
    List<WorkoutSets>? workout_sets,
    String? title,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWorkout.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWorkout.copyWith.fieldName(...)`
class _$WorkoutCWProxyImpl implements _$WorkoutCWProxy {
  const _$WorkoutCWProxyImpl(this._value);

  final Workout _value;

  @override
  Workout creator_id(String? creator_id) => this(creator_id: creator_id);

  @override
  Workout creator(User? creator) => this(creator: creator);

  @override
  Workout description(String? description) => this(description: description);

  @override
  Workout id(int? id) => this(id: id);

  @override
  Workout workout_sets(List<WorkoutSets>? workout_sets) =>
      this(workout_sets: workout_sets);

  @override
  Workout title(String? title) => this(title: title);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Workout(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Workout(...).copyWith(id: 12, name: "My name")
  /// ````
  Workout call({
    Object? creator_id = const $CopyWithPlaceholder(),
    Object? creator = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? workout_sets = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
  }) {
    return Workout(
      creator_id: creator_id == const $CopyWithPlaceholder()
          ? _value.creator_id
          // ignore: cast_nullable_to_non_nullable
          : creator_id as String?,
      creator: creator == const $CopyWithPlaceholder()
          ? _value.creator
          // ignore: cast_nullable_to_non_nullable
          : creator as User?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      workout_sets: workout_sets == const $CopyWithPlaceholder()
          ? _value.workout_sets
          // ignore: cast_nullable_to_non_nullable
          : workout_sets as List<WorkoutSets>?,
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String?,
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

Workout _$WorkoutFromJson(Map json) => Workout(
      creator_id: json['creator_id'] as String?,
      creator: json['creator'] == null
          ? null
          : User.fromJson(Map<String, dynamic>.from(json['creator'] as Map)),
      description: json['description'] as String?,
      id: json['id'] as int?,
      workout_sets: (json['workout_sets'] as List<dynamic>?)
          ?.map(
              (e) => WorkoutSets.fromJson(Map<String, dynamic>.from(e as Map)))
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
      'creator': instance.creator?.toJson(),
      'creator_id': instance.creator_id,
      'workout_sets': instance.workout_sets?.map((e) => e.toJson()).toList(),
    };
