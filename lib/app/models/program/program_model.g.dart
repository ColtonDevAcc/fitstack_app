// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ProgramCWProxy {
  Program creator(String creator);

  Program description(String description);

  Program id(String id);

  Program routine(Routine? routine);

  Program title(String title);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Program(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Program(...).copyWith(id: 12, name: "My name")
  /// ````
  Program call({
    String? creator,
    String? description,
    String? id,
    Routine? routine,
    String? title,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProgram.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProgram.copyWith.fieldName(...)`
class _$ProgramCWProxyImpl implements _$ProgramCWProxy {
  final Program _value;

  const _$ProgramCWProxyImpl(this._value);

  @override
  Program creator(String creator) => this(creator: creator);

  @override
  Program description(String description) => this(description: description);

  @override
  Program id(String id) => this(id: id);

  @override
  Program routine(Routine? routine) => this(routine: routine);

  @override
  Program title(String title) => this(title: title);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Program(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Program(...).copyWith(id: 12, name: "My name")
  /// ````
  Program call({
    Object? creator = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? routine = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
  }) {
    return Program(
      creator: creator == const $CopyWithPlaceholder() || creator == null
          ? _value.creator
          // ignore: cast_nullable_to_non_nullable
          : creator as String,
      description:
          description == const $CopyWithPlaceholder() || description == null
              ? _value.description
              // ignore: cast_nullable_to_non_nullable
              : description as String,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      routine: routine == const $CopyWithPlaceholder()
          ? _value.routine
          // ignore: cast_nullable_to_non_nullable
          : routine as Routine?,
      title: title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
    );
  }
}

extension $ProgramCopyWith on Program {
  /// Returns a callable class that can be used as follows: `instanceOfProgram.copyWith(...)` or like so:`instanceOfProgram.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ProgramCWProxy get copyWith => _$ProgramCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Program _$ProgramFromJson(Map<String, dynamic> json) => Program(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      creator: json['creator'] as String,
      routine: json['routine'] == null
          ? null
          : Routine.fromJson(json['routine'] as Map<String, dynamic>),
    );

const _$ProgramFieldMap = <String, String>{
  'id': 'id',
  'title': 'title',
  'description': 'description',
  'creator': 'creator',
  'routine': 'routine',
};

Map<String, dynamic> _$ProgramToJson(Program instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'creator': instance.creator,
      'routine': instance.routine,
    };
