// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ProgramCWProxy {
  Program createdAt(DateTime? createdAt);

  Program updatedAt(DateTime? updatedAt);

  Program deletedAt(DateTime? deletedAt);

  Program id(int id);

  Program title(String title);

  Program description(String description);

  Program creator(User? creator);

  Program routine(Routine? routine);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Program(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Program(...).copyWith(id: 12, name: "My name")
  /// ````
  Program call({
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    int? id,
    String? title,
    String? description,
    User? creator,
    Routine? routine,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProgram.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProgram.copyWith.fieldName(...)`
class _$ProgramCWProxyImpl implements _$ProgramCWProxy {
  const _$ProgramCWProxyImpl(this._value);

  final Program _value;

  @override
  Program createdAt(DateTime? createdAt) => this(createdAt: createdAt);

  @override
  Program updatedAt(DateTime? updatedAt) => this(updatedAt: updatedAt);

  @override
  Program deletedAt(DateTime? deletedAt) => this(deletedAt: deletedAt);

  @override
  Program id(int id) => this(id: id);

  @override
  Program title(String title) => this(title: title);

  @override
  Program description(String description) => this(description: description);

  @override
  Program creator(User? creator) => this(creator: creator);

  @override
  Program routine(Routine? routine) => this(routine: routine);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Program(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Program(...).copyWith(id: 12, name: "My name")
  /// ````
  Program call({
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
    Object? deletedAt = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? creator = const $CopyWithPlaceholder(),
    Object? routine = const $CopyWithPlaceholder(),
  }) {
    return Program(
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime?,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime?,
      deletedAt: deletedAt == const $CopyWithPlaceholder()
          ? _value.deletedAt
          // ignore: cast_nullable_to_non_nullable
          : deletedAt as DateTime?,
      id: id == const $CopyWithPlaceholder() || id == null
          // ignore: unnecessary_non_null_assertion
          ? _value.id!
          // ignore: cast_nullable_to_non_nullable
          : id as int,
      title: title == const $CopyWithPlaceholder() || title == null
          // ignore: unnecessary_non_null_assertion
          ? _value.title!
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      description:
          description == const $CopyWithPlaceholder() || description == null
              // ignore: unnecessary_non_null_assertion
              ? _value.description!
              // ignore: cast_nullable_to_non_nullable
              : description as String,
      creator: creator == const $CopyWithPlaceholder()
          ? _value.creator
          // ignore: cast_nullable_to_non_nullable
          : creator as User?,
      routine: routine == const $CopyWithPlaceholder()
          ? _value.routine
          // ignore: cast_nullable_to_non_nullable
          : routine as Routine?,
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

Program _$ProgramFromJson(Map json) => Program(
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
          : User.fromJson(Map<String, dynamic>.from(json['creator'] as Map)),
      routine: json['routine'] == null
          ? null
          : Routine.fromJson(Map<String, dynamic>.from(json['routine'] as Map)),
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
      'creator': instance.creator?.toJson(),
      'routine': instance.routine?.toJson(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
