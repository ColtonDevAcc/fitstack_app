// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friendship_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FriendshipCWProxy {
  Friendship accepted(bool accepted);

  Friendship from_user(String from_user);

  Friendship response_time(String? response_time);

  Friendship sent_time(String sent_time);

  Friendship to_user(String to_user);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Friendship(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Friendship(...).copyWith(id: 12, name: "My name")
  /// ````
  Friendship call({
    bool? accepted,
    String? from_user,
    String? response_time,
    String? sent_time,
    String? to_user,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFriendship.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFriendship.copyWith.fieldName(...)`
class _$FriendshipCWProxyImpl implements _$FriendshipCWProxy {
  final Friendship _value;

  const _$FriendshipCWProxyImpl(this._value);

  @override
  Friendship accepted(bool accepted) => this(accepted: accepted);

  @override
  Friendship from_user(String from_user) => this(from_user: from_user);

  @override
  Friendship response_time(String? response_time) =>
      this(response_time: response_time);

  @override
  Friendship sent_time(String sent_time) => this(sent_time: sent_time);

  @override
  Friendship to_user(String to_user) => this(to_user: to_user);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Friendship(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Friendship(...).copyWith(id: 12, name: "My name")
  /// ````
  Friendship call({
    Object? accepted = const $CopyWithPlaceholder(),
    Object? from_user = const $CopyWithPlaceholder(),
    Object? response_time = const $CopyWithPlaceholder(),
    Object? sent_time = const $CopyWithPlaceholder(),
    Object? to_user = const $CopyWithPlaceholder(),
  }) {
    return Friendship(
      accepted: accepted == const $CopyWithPlaceholder() || accepted == null
          ? _value.accepted
          // ignore: cast_nullable_to_non_nullable
          : accepted as bool,
      from_user: from_user == const $CopyWithPlaceholder() || from_user == null
          ? _value.from_user
          // ignore: cast_nullable_to_non_nullable
          : from_user as String,
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
      sent_time: json['sent_time'] as String,
      response_time: json['response_time'] as String?,
      accepted: json['accepted'] as bool,
      to_user: json['to_user'] as String,
      from_user: json['from_user'] as String,
    );

const _$FriendshipFieldMap = <String, String>{
  'to_user': 'to_user',
  'from_user': 'from_user',
  'sent_time': 'sent_time',
  'response_time': 'response_time',
  'accepted': 'accepted',
};

Map<String, dynamic> _$FriendshipToJson(Friendship instance) =>
    <String, dynamic>{
      'to_user': instance.to_user,
      'from_user': instance.from_user,
      'sent_time': instance.sent_time,
      'response_time': instance.response_time,
      'accepted': instance.accepted,
    };
