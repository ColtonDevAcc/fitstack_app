// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'muscle_target_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MuscleTargetCWProxy {
  MuscleTarget image(String? image);

  MuscleTarget description(String? description);

  MuscleTarget name(String name);

  MuscleTarget id(String id);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MuscleTarget(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MuscleTarget(...).copyWith(id: 12, name: "My name")
  /// ````
  MuscleTarget call({
    String? image,
    String? description,
    String? name,
    int? id,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMuscleTarget.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMuscleTarget.copyWith.fieldName(...)`
class _$MuscleTargetCWProxyImpl implements _$MuscleTargetCWProxy {
  const _$MuscleTargetCWProxyImpl(this._value);

  final MuscleTarget _value;

  @override
  MuscleTarget image(String? image) => this(image: image);

  @override
  MuscleTarget description(String? description) => this(description: description);

  @override
  MuscleTarget name(String name) => this(name: name);

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
    Object? image = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
  }) {
    return MuscleTarget(
      image: image == const $CopyWithPlaceholder()
          ? _value.image
          // ignore: cast_nullable_to_non_nullable
          : image as String?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      name: name == const $CopyWithPlaceholder() || name == null
          // ignore: unnecessary_non_null_assertion
          ? _value.name!
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      id: id == const $CopyWithPlaceholder() || id == null
          // ignore: unnecessary_non_null_assertion
          ? _value.id!
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

MuscleTarget _$MuscleTargetFromJson(Map json) => MuscleTarget(
      image: json['image'] as String?,
      description: json['description'] as String?,
      name: json['name'] as String,
      id: json['id'] as String,
    );

const _$MuscleTargetFieldMap = <String, String>{
  'id': 'id',
  'name': 'name',
  'description': 'description',
  'image': 'image',
};

Map<String, dynamic> _$MuscleTargetToJson(MuscleTarget instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
    };
