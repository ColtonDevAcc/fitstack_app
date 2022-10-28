// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'muscle_target_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MuscleTargetCWProxy {
  MuscleTarget id(String id);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MuscleTarget(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MuscleTarget(...).copyWith(id: 12, name: "My name")
  /// ````
  MuscleTarget call({
    String? id,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMuscleTarget.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMuscleTarget.copyWith.fieldName(...)`
class _$MuscleTargetCWProxyImpl implements _$MuscleTargetCWProxy {
  final MuscleTarget _value;

  const _$MuscleTargetCWProxyImpl(this._value);

  @override
  MuscleTarget id(String id) => this(id: id);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MuscleTarget(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MuscleTarget(...).copyWith(id: 12, name: "My name")
  /// ````
  MuscleTarget call({
    Object? id = const $CopyWithPlaceholder(),
  }) {
    return MuscleTarget(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
    );
  }
}

extension $MuscleTargetCopyWith on MuscleTarget {
  /// Returns a callable class that can be used as follows: `instanceOfMuscleTarget.copyWith(...)` or like so:`instanceOfMuscleTarget.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MuscleTargetCWProxy get copyWith => _$MuscleTargetCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MuscleTarget _$MuscleTargetFromJson(Map<String, dynamic> json) => MuscleTarget(
      id: json['id'] as String,
    );

const _$MuscleTargetFieldMap = <String, String>{
  'id': 'id',
};

Map<String, dynamic> _$MuscleTargetToJson(MuscleTarget instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
