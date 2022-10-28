// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friendship_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FriendshipCWProxy {
  Friendship accepted(bool accepted);

  Friendship deleted_at(DateTime? deleted_at);

  Friendship from_user(String from_user);

  Friendship id(String id);

  Friendship response_time(String? response_time);

  Friendship sent_time(String sent_time);

  Friendship to_user(String to_user);

  Friendship updated_at(DateTime? updated_at);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Friendship(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Friendship(...).copyWith(id: 12, name: "My name")
  /// ````
  Friendship call({
    bool? accepted,
    DateTime? deleted_at,
    String? from_user,
    String? id,
    String? response_time,
    String? sent_time,
    String? to_user,
    DateTime? updated_at,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFriendship.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFriendship.copyWith.fieldName(...)`
class _$FriendshipCWProxyImpl implements _$FriendshipCWProxy {
  final Friendship _value;

  const _$FriendshipCWProxyImpl(this._value);

  @override
  Friendship accepted(bool accepted) => this(accepted: accepted);

  @override
  Friendship deleted_at(DateTime? deleted_at) => this(deleted_at: deleted_at);

  @override
  Friendship from_user(String from_user) => this(from_user: from_user);

  @override
  Friendship id(String id) => this(id: id);

  @override
  Friendship response_time(String? response_time) =>
      this(response_time: response_time);

  @override
  Friendship sent_time(String sent_time) => this(sent_time: sent_time);

  @override
  Friendship to_user(String to_user) => this(to_user: to_user);

  @override
  Friendship updated_at(DateTime? updated_at) => this(updated_at: updated_at);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Friendship(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Friendship(...).copyWith(id: 12, name: "My name")
  /// ````
  Friendship call({
    Object? accepted = const $CopyWithPlaceholder(),
    Object? deleted_at = const $CopyWithPlaceholder(),
    Object? from_user = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? response_time = const $CopyWithPlaceholder(),
    Object? sent_time = const $CopyWithPlaceholder(),
    Object? to_user = const $CopyWithPlaceholder(),
    Object? updated_at = const $CopyWithPlaceholder(),
  }) {
    return Friendship(
      accepted: accepted == const $CopyWithPlaceholder() || accepted == null
          ? _value.accepted
          // ignore: cast_nullable_to_non_nullable
          : accepted as bool,
      deleted_at: deleted_at == const $CopyWithPlaceholder()
          ? _value.deleted_at
          // ignore: cast_nullable_to_non_nullable
          : deleted_at as DateTime?,
      from_user: from_user == const $CopyWithPlaceholder() || from_user == null
          ? _value.from_user
          // ignore: cast_nullable_to_non_nullable
          : from_user as String,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      response_time: response_time == const $CopyWithPlaceholder()
          ? _value.response_time
          // ignore: cast_nullable_to_non_nullable
          : response_time as String?,
      sent_time: sent_time == const $CopyWithPlaceholder() || sent_time == null
          ? _value.sent_time
          // ignore: cast_nullable_to_non_nullable
          : sent_time as String,
      to_user: to_user == const $CopyWithPlaceholder() || to_user == null
          ? _value.to_user
          // ignore: cast_nullable_to_non_nullable
          : to_user as String,
      updated_at: updated_at == const $CopyWithPlaceholder()
          ? _value.updated_at
          // ignore: cast_nullable_to_non_nullable
          : updated_at as DateTime?,
    );
  }
}

extension $FriendshipCopyWith on Friendship {
  /// Returns a callable class that can be used as follows: `instanceOfFriendship.copyWith(...)` or like so:`instanceOfFriendship.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FriendshipCWProxy get copyWith => _$FriendshipCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Friendship _$FriendshipFromJson(Map<String, dynamic> json) => Friendship(
      id: json['id'] as String,
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deleted_at: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      sent_time: json['sent_time'] as String,
      response_time: json['response_time'] as String?,
      accepted: json['accepted'] as bool,
      to_user: json['to_user'] as String,
      from_user: json['from_user'] as String,
    );

const _$FriendshipFieldMap = <String, String>{
  'id': 'id',
  'from_user': 'from_user',
  'to_user': 'to_user',
  'accepted': 'accepted',
  'sent_time': 'sent_time',
  'response_time': 'response_time',
  'updated_at': 'updated_at',
  'deleted_at': 'deleted_at',
};

Map<String, dynamic> _$FriendshipToJson(Friendship instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from_user': instance.from_user,
      'to_user': instance.to_user,
      'accepted': instance.accepted,
      'sent_time': instance.sent_time,
      'response_time': instance.response_time,
      'updated_at': instance.updated_at?.toIso8601String(),
      'deleted_at': instance.deleted_at?.toIso8601String(),
    };
