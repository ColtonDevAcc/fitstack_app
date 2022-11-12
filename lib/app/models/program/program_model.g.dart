// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ProgramCWProxy {
  Program createdAt(DateTime? createdAt);

  Program creator(User? creator);

  Program deletedAt(DateTime? deletedAt);

  Program description(String description);

  Program id(int id);

  Program routine(Routine? routine);

  Program title(String title);

  Program updatedAt(DateTime? updatedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Program(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Program(...).copyWith(id: 12, name: "My name")
  /// ````
  Program call({
    DateTime? createdAt,
    User? creator,
    DateTime? deletedAt,
    String? description,
    int? id,
    Routine? routine,
    String? title,
    DateTime? updatedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProgram.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProgram.copyWith.fieldName(...)`
class _$ProgramCWProxyImpl implements _$ProgramCWProxy {
  final Program _value;

  const _$ProgramCWProxyImpl(this._value);

  @override
  Program createdAt(DateTime? createdAt) => this(createdAt: createdAt);

  @override
  Program creator(User? creator) => this(creator: creator);

  @override
  Program deletedAt(DateTime? deletedAt) => this(deletedAt: deletedAt);

  @override
  Program description(String description) => this(description: description);

  @override
  Program id(int id) => this(id: id);

  @override
  Program routine(Routine? routine) => this(routine: routine);

  @override
  Program title(String title) => this(title: title);

  @override
  Program updatedAt(DateTime? updatedAt) => this(updatedAt: updatedAt);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Program(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Program(...).copyWith(id: 12, name: "My name")
  /// ````
  Program call({
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? creator = const $CopyWithPlaceholder(),
    Object? deletedAt = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? routine = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
  }) {
    return Program(
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime?,
      creator: creator == const $CopyWithPlaceholder()
          ? _value.creator
          // ignore: cast_nullable_to_non_nullable
          : creator as User?,
      deletedAt: deletedAt == const $CopyWithPlaceholder()
          ? _value.deletedAt
          // ignore: cast_nullable_to_non_nullable
          : deletedAt as DateTime?,
      description:
          description == const $CopyWithPlaceholder() || description == null
              ? _value.description
              // ignore: cast_nullable_to_non_nullable
              : description as String,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int,
      routine: routine == const $CopyWithPlaceholder()
          ? _value.routine
          // ignore: cast_nullable_to_non_nullable
          : routine as Routine?,
      title: title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime?,
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
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      creator: json['creator'] == null
          ? null
          : User.fromJson(json['creator'] as Map<String, dynamic>),
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
  'createdAt': 'createdAt',
  'updatedAt': 'updatedAt',
  'deletedAt': 'deletedAt',
};

Map<String, dynamic> _$ProgramToJson(Program instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'creator': instance.creator,
      'routine': instance.routine,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
