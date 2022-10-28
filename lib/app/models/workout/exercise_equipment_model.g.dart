// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_equipment_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ExerciseEquipmentCWProxy {
  ExerciseEquipment id(String id);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ExerciseEquipment(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ExerciseEquipment(...).copyWith(id: 12, name: "My name")
  /// ````
  ExerciseEquipment call({
    String? id,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfExerciseEquipment.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfExerciseEquipment.copyWith.fieldName(...)`
class _$ExerciseEquipmentCWProxyImpl implements _$ExerciseEquipmentCWProxy {
  final ExerciseEquipment _value;

  const _$ExerciseEquipmentCWProxyImpl(this._value);

  @override
  ExerciseEquipment id(String id) => this(id: id);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ExerciseEquipment(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ExerciseEquipment(...).copyWith(id: 12, name: "My name")
  /// ````
  ExerciseEquipment call({
    Object? id = const $CopyWithPlaceholder(),
  }) {
    return ExerciseEquipment(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
    );
  }
}

extension $ExerciseEquipmentCopyWith on ExerciseEquipment {
  /// Returns a callable class that can be used as follows: `instanceOfExerciseEquipment.copyWith(...)` or like so:`instanceOfExerciseEquipment.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ExerciseEquipmentCWProxy get copyWith =>
      _$ExerciseEquipmentCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseEquipment _$ExerciseEquipmentFromJson(Map<String, dynamic> json) =>
    ExerciseEquipment(
      id: json['id'] as String,
    );

const _$ExerciseEquipmentFieldMap = <String, String>{
  'id': 'id',
};

Map<String, dynamic> _$ExerciseEquipmentToJson(ExerciseEquipment instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
