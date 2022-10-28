// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ExerciseCWProxy {
  Exercise description(String? description);

  Exercise exercise_equipment(ExerciseEquipment? exercise_equipment);

  Exercise exercise_type(ExerciseType? exercise_type);

  Exercise id(int? id);

  Exercise image(String? image);

  Exercise met_value(double? met_value);

  Exercise muscle_target(MuscleTarget? muscle_target);

  Exercise name(String? name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Exercise(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Exercise(...).copyWith(id: 12, name: "My name")
  /// ````
  Exercise call({
    String? description,
    ExerciseEquipment? exercise_equipment,
    ExerciseType? exercise_type,
    int? id,
    String? image,
    double? met_value,
    MuscleTarget? muscle_target,
    String? name,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfExercise.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfExercise.copyWith.fieldName(...)`
class _$ExerciseCWProxyImpl implements _$ExerciseCWProxy {
  final Exercise _value;

  const _$ExerciseCWProxyImpl(this._value);

  @override
  Exercise description(String? description) => this(description: description);

  @override
  Exercise exercise_equipment(ExerciseEquipment? exercise_equipment) =>
      this(exercise_equipment: exercise_equipment);

  @override
  Exercise exercise_type(ExerciseType? exercise_type) =>
      this(exercise_type: exercise_type);

  @override
  Exercise id(int? id) => this(id: id);

  @override
  Exercise image(String? image) => this(image: image);

  @override
  Exercise met_value(double? met_value) => this(met_value: met_value);

  @override
  Exercise muscle_target(MuscleTarget? muscle_target) =>
      this(muscle_target: muscle_target);

  @override
  Exercise name(String? name) => this(name: name);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Exercise(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Exercise(...).copyWith(id: 12, name: "My name")
  /// ````
  Exercise call({
    Object? description = const $CopyWithPlaceholder(),
    Object? exercise_equipment = const $CopyWithPlaceholder(),
    Object? exercise_type = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? image = const $CopyWithPlaceholder(),
    Object? met_value = const $CopyWithPlaceholder(),
    Object? muscle_target = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return Exercise(
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      exercise_equipment: exercise_equipment == const $CopyWithPlaceholder()
          ? _value.exercise_equipment
          // ignore: cast_nullable_to_non_nullable
          : exercise_equipment as ExerciseEquipment?,
      exercise_type: exercise_type == const $CopyWithPlaceholder()
          ? _value.exercise_type
          // ignore: cast_nullable_to_non_nullable
          : exercise_type as ExerciseType?,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      image: image == const $CopyWithPlaceholder()
          ? _value.image
          // ignore: cast_nullable_to_non_nullable
          : image as String?,
      met_value: met_value == const $CopyWithPlaceholder()
          ? _value.met_value
          // ignore: cast_nullable_to_non_nullable
          : met_value as double?,
      muscle_target: muscle_target == const $CopyWithPlaceholder()
          ? _value.muscle_target
          // ignore: cast_nullable_to_non_nullable
          : muscle_target as MuscleTarget?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
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
      muscle_target: json['muscle_target'] == null
          ? null
          : MuscleTarget.fromJson(
              json['muscle_target'] as Map<String, dynamic>),
      name: json['name'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      met_value: (json['met_value'] as num?)?.toDouble(),
      exercise_type: json['exercise_type'] == null
          ? null
          : ExerciseType.fromJson(
              json['exercise_type'] as Map<String, dynamic>),
      exercise_equipment: json['exercise_equipment'] == null
          ? null
          : ExerciseEquipment.fromJson(
              json['exercise_equipment'] as Map<String, dynamic>),
      id: json['id'] as int?,
    );

const _$ExerciseFieldMap = <String, String>{
  'id': 'id',
  'name': 'name',
  'description': 'description',
  'image': 'image',
  'met_value': 'met_value',
  'exercise_type': 'exercise_type',
  'exercise_equipment': 'exercise_equipment',
  'muscle_target': 'muscle_target',
};

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'met_value': instance.met_value,
      'exercise_type': instance.exercise_type,
      'exercise_equipment': instance.exercise_equipment,
      'muscle_target': instance.muscle_target,
    };
