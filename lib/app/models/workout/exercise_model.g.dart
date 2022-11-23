// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ExerciseCWProxy {
  Exercise creator(User creator);

  Exercise creator_id(String creator_id);

  Exercise description(String? description);

  Exercise exercise_equipment(List<ExerciseEquipment>? exercise_equipment);

  Exercise id(int? id);

  Exercise images(List<String>? images);

  Exercise met_value(double? met_value);

  Exercise muscle_target(List<MuscleTarget>? muscle_target);

  Exercise name(String? name);

  Exercise type(ExerciseType? type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Exercise(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Exercise(...).copyWith(id: 12, name: "My name")
  /// ````
  Exercise call({
    User? creator,
    String? creator_id,
    String? description,
    List<ExerciseEquipment>? exercise_equipment,
    int? id,
    List<String>? images,
    double? met_value,
    List<MuscleTarget>? muscle_target,
    String? name,
    ExerciseType? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfExercise.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfExercise.copyWith.fieldName(...)`
class _$ExerciseCWProxyImpl implements _$ExerciseCWProxy {
  final Exercise _value;

  const _$ExerciseCWProxyImpl(this._value);

  @override
  Exercise creator(User creator) => this(creator: creator);

  @override
  Exercise creator_id(String creator_id) => this(creator_id: creator_id);

  @override
  Exercise description(String? description) => this(description: description);

  @override
  Exercise exercise_equipment(List<ExerciseEquipment>? exercise_equipment) =>
      this(exercise_equipment: exercise_equipment);

  @override
  Exercise id(int? id) => this(id: id);

  @override
  Exercise images(List<String>? images) => this(images: images);

  @override
  Exercise met_value(double? met_value) => this(met_value: met_value);

  @override
  Exercise muscle_target(List<MuscleTarget>? muscle_target) =>
      this(muscle_target: muscle_target);

  @override
  Exercise name(String? name) => this(name: name);

  @override
  Exercise type(ExerciseType? type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Exercise(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Exercise(...).copyWith(id: 12, name: "My name")
  /// ````
  Exercise call({
    Object? creator = const $CopyWithPlaceholder(),
    Object? creator_id = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? exercise_equipment = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? images = const $CopyWithPlaceholder(),
    Object? met_value = const $CopyWithPlaceholder(),
    Object? muscle_target = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return Exercise(
      creator: creator == const $CopyWithPlaceholder() || creator == null
          ? _value.creator
          // ignore: cast_nullable_to_non_nullable
          : creator as User,
      creator_id:
          creator_id == const $CopyWithPlaceholder() || creator_id == null
              ? _value.creator_id
              // ignore: cast_nullable_to_non_nullable
              : creator_id as String,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      exercise_equipment: exercise_equipment == const $CopyWithPlaceholder()
          ? _value.exercise_equipment
          // ignore: cast_nullable_to_non_nullable
          : exercise_equipment as List<ExerciseEquipment>?,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      images: images == const $CopyWithPlaceholder()
          ? _value.images
          // ignore: cast_nullable_to_non_nullable
          : images as List<String>?,
      met_value: met_value == const $CopyWithPlaceholder()
          ? _value.met_value
          // ignore: cast_nullable_to_non_nullable
          : met_value as double?,
      muscle_target: muscle_target == const $CopyWithPlaceholder()
          ? _value.muscle_target
          // ignore: cast_nullable_to_non_nullable
          : muscle_target as List<MuscleTarget>?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as ExerciseType?,
    );
  }
}

extension $ExerciseCopyWith on Exercise {
  /// Returns a callable class that can be used as follows: `instanceOfExercise.copyWith(...)` or like so:`instanceOfExercise.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ExerciseCWProxy get copyWith => _$ExerciseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercise _$ExerciseFromJson(Map<String, dynamic> json) => Exercise(
      creator_id: json['creator_id'] as String,
      creator: User.fromJson(json['creator'] as Map<String, dynamic>),
      muscle_target: (json['muscle_target'] as List<dynamic>?)
          ?.map((e) => MuscleTarget.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      met_value: (json['met_value'] as num?)?.toDouble(),
      type: $enumDecodeNullable(_$ExerciseTypeEnumMap, json['type']),
      exercise_equipment: (json['exercise_equipment'] as List<dynamic>?)
          ?.map((e) => ExerciseEquipment.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as int?,
    );

const _$ExerciseFieldMap = <String, String>{
  'id': 'id',
  'name': 'name',
  'description': 'description',
  'images': 'images',
  'met_value': 'met_value',
  'creator': 'creator',
  'creator_id': 'creator_id',
  'type': 'type',
  'exercise_equipment': 'exercise_equipment',
  'muscle_target': 'muscle_target',
};

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'images': instance.images,
      'met_value': instance.met_value,
      'creator': instance.creator,
      'creator_id': instance.creator_id,
      'type': _$ExerciseTypeEnumMap[instance.type],
      'exercise_equipment': instance.exercise_equipment,
      'muscle_target': instance.muscle_target,
    };

const _$ExerciseTypeEnumMap = {
  ExerciseType.push: 'push',
  ExerciseType.pull: 'pull',
  ExerciseType.legs: 'legs',
  ExerciseType.core: 'core',
  ExerciseType.cardio: 'cardio',
  ExerciseType.other: 'other',
};
