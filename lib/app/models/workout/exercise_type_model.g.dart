// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_type_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ExerciseTypeCWProxy {
  ExerciseType id(String id);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ExerciseType(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ExerciseType(...).copyWith(id: 12, name: "My name")
  /// ````
  ExerciseType call({
    String? id,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfExerciseType.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfExerciseType.copyWith.fieldName(...)`
class _$ExerciseTypeCWProxyImpl implements _$ExerciseTypeCWProxy {
  final ExerciseType _value;

  const _$ExerciseTypeCWProxyImpl(this._value);

  @override
  ExerciseType id(String id) => this(id: id);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ExerciseType(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ExerciseType(...).copyWith(id: 12, name: "My name")
  /// ````
  ExerciseType call({
    Object? id = const $CopyWithPlaceholder(),
  }) {
    return ExerciseType(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
    );
  }
}

extension $ExerciseTypeCopyWith on ExerciseType {
  /// Returns a callable class that can be used as follows: `instanceOfExerciseType.copyWith(...)` or like so:`instanceOfExerciseType.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ExerciseTypeCWProxy get copyWith => _$ExerciseTypeCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseType _$ExerciseTypeFromJson(Map<String, dynamic> json) => ExerciseType(
      id: json['id'] as String,
    );

const _$ExerciseTypeFieldMap = <String, String>{
  'id': 'id',
};

Map<String, dynamic> _$ExerciseTypeToJson(ExerciseType instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
