// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WorkoutCWProxy {
  Workout name(String name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Workout(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Workout(...).copyWith(id: 12, name: "My name")
  /// ````
  Workout call({
    String? name,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWorkout.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWorkout.copyWith.fieldName(...)`
class _$WorkoutCWProxyImpl implements _$WorkoutCWProxy {
  final Workout _value;

  const _$WorkoutCWProxyImpl(this._value);

  @override
  Workout name(String name) => this(name: name);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Workout(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Workout(...).copyWith(id: 12, name: "My name")
  /// ````
  Workout call({
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return Workout(
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
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
      name: json['name'] as String,
    );

const _$WorkoutFieldMap = <String, String>{
  'name': 'name',
};

Map<String, dynamic> _$WorkoutToJson(Workout instance) => <String, dynamic>{
      'name': instance.name,
    };
