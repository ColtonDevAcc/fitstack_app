// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserProfileCWProxy {
  UserProfile achievements(List<dynamic>? achievements);

  UserProfile avatar(String? avatar);

  UserProfile challenges(List<dynamic>? challenges);

  UserProfile created_at(DateTime? created_at);

  UserProfile days_logged_in_a_row(int days_logged_in_a_row);

  UserProfile display_name(String display_name);

  UserProfile fit_credits(int fit_credits);

  UserProfile friends(List<UserProfile>? friends);

  UserProfile id(String id);

  UserProfile social_points(int social_points);

  UserProfile updated_at(DateTime? updated_at);

  UserProfile user_statistics(UserStatistic? user_statistics);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserProfile(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserProfile(...).copyWith(id: 12, name: "My name")
  /// ````
  UserProfile call({
    List<dynamic>? achievements,
    String? avatar,
    List<dynamic>? challenges,
    DateTime? created_at,
    int? days_logged_in_a_row,
    String? display_name,
    int? fit_credits,
    List<UserProfile>? friends,
    String? id,
    int? social_points,
    DateTime? updated_at,
    UserStatistic? user_statistics,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUserProfile.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUserProfile.copyWith.fieldName(...)`
class _$UserProfileCWProxyImpl implements _$UserProfileCWProxy {
  final UserProfile _value;

  const _$UserProfileCWProxyImpl(this._value);

  @override
  UserProfile achievements(List<dynamic>? achievements) =>
      this(achievements: achievements);

  @override
  UserProfile avatar(String? avatar) => this(avatar: avatar);

  @override
  UserProfile challenges(List<dynamic>? challenges) =>
      this(challenges: challenges);

  @override
  UserProfile created_at(DateTime? created_at) => this(created_at: created_at);

  @override
  UserProfile days_logged_in_a_row(int days_logged_in_a_row) =>
      this(days_logged_in_a_row: days_logged_in_a_row);

  @override
  UserProfile display_name(String display_name) =>
      this(display_name: display_name);

  @override
  UserProfile fit_credits(int fit_credits) => this(fit_credits: fit_credits);

  @override
  UserProfile friends(List<UserProfile>? friends) => this(friends: friends);

  @override
  UserProfile id(String id) => this(id: id);

  @override
  UserProfile social_points(int social_points) =>
      this(social_points: social_points);

  @override
  UserProfile updated_at(DateTime? updated_at) => this(updated_at: updated_at);

  @override
  UserProfile user_statistics(UserStatistic? user_statistics) =>
      this(user_statistics: user_statistics);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserProfile(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserProfile(...).copyWith(id: 12, name: "My name")
  /// ````
  UserProfile call({
    Object? achievements = const $CopyWithPlaceholder(),
    Object? avatar = const $CopyWithPlaceholder(),
    Object? challenges = const $CopyWithPlaceholder(),
    Object? created_at = const $CopyWithPlaceholder(),
    Object? days_logged_in_a_row = const $CopyWithPlaceholder(),
    Object? display_name = const $CopyWithPlaceholder(),
    Object? fit_credits = const $CopyWithPlaceholder(),
    Object? friends = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? social_points = const $CopyWithPlaceholder(),
    Object? updated_at = const $CopyWithPlaceholder(),
    Object? user_statistics = const $CopyWithPlaceholder(),
  }) {
    return UserProfile(
      achievements: achievements == const $CopyWithPlaceholder()
          ? _value.achievements
          // ignore: cast_nullable_to_non_nullable
          : achievements as List<dynamic>?,
      avatar: avatar == const $CopyWithPlaceholder()
          ? _value.avatar
          // ignore: cast_nullable_to_non_nullable
          : avatar as String?,
      challenges: challenges == const $CopyWithPlaceholder()
          ? _value.challenges
          // ignore: cast_nullable_to_non_nullable
          : challenges as List<dynamic>?,
      created_at: created_at == const $CopyWithPlaceholder()
          ? _value.created_at
          // ignore: cast_nullable_to_non_nullable
          : created_at as DateTime?,
      days_logged_in_a_row:
          days_logged_in_a_row == const $CopyWithPlaceholder() ||
                  days_logged_in_a_row == null
              ? _value.days_logged_in_a_row
              // ignore: cast_nullable_to_non_nullable
              : days_logged_in_a_row as int,
      display_name:
          display_name == const $CopyWithPlaceholder() || display_name == null
              ? _value.display_name
              // ignore: cast_nullable_to_non_nullable
              : display_name as String,
      fit_credits:
          fit_credits == const $CopyWithPlaceholder() || fit_credits == null
              ? _value.fit_credits
              // ignore: cast_nullable_to_non_nullable
              : fit_credits as int,
      friends: friends == const $CopyWithPlaceholder()
          ? _value.friends
          // ignore: cast_nullable_to_non_nullable
          : friends as List<UserProfile>?,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      social_points:
          social_points == const $CopyWithPlaceholder() || social_points == null
              ? _value.social_points
              // ignore: cast_nullable_to_non_nullable
              : social_points as int,
      updated_at: updated_at == const $CopyWithPlaceholder()
          ? _value.updated_at
          // ignore: cast_nullable_to_non_nullable
          : updated_at as DateTime?,
      user_statistics: user_statistics == const $CopyWithPlaceholder()
          ? _value.user_statistics
          // ignore: cast_nullable_to_non_nullable
          : user_statistics as UserStatistic?,
    );
  }
}

extension $UserProfileCopyWith on UserProfile {
  /// Returns a callable class that can be used as follows: `instanceOfUserProfile.copyWith(...)` or like so:`instanceOfUserProfile.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UserProfileCWProxy get copyWith => _$UserProfileCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
      friends: (json['friends'] as List<dynamic>?)
          ?.map((e) => UserProfile.fromJson(e as Map<String, dynamic>))
          .toList(),
      user_statistics: json['user_statistics'] == null
          ? null
          : UserStatistic.fromJson(
              json['user_statistics'] as Map<String, dynamic>),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      display_name: json['display_name'] as String,
      id: json['id'] as String,
      challenges: json['challenges'] as List<dynamic>?,
      achievements: json['achievements'] as List<dynamic>?,
      fit_credits: json['fit_credits'] as int,
      social_points: json['social_points'] as int,
      days_logged_in_a_row: json['days_logged_in_a_row'] as int,
      avatar: json['avatar'] as String?,
    );

const _$UserProfileFieldMap = <String, String>{
  'id': 'id',
  'display_name': 'display_name',
  'challenges': 'challenges',
  'achievements': 'achievements',
  'user_statistics': 'user_statistics',
  'friends': 'friends',
  'fit_credits': 'fit_credits',
  'social_points': 'social_points',
  'days_logged_in_a_row': 'days_logged_in_a_row',
  'avatar': 'avatar',
  'updated_at': 'updated_at',
  'created_at': 'created_at',
};

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'display_name': instance.display_name,
      'challenges': instance.challenges,
      'achievements': instance.achievements,
      'user_statistics': instance.user_statistics,
      'friends': instance.friends,
      'fit_credits': instance.fit_credits,
      'social_points': instance.social_points,
      'days_logged_in_a_row': instance.days_logged_in_a_row,
      'avatar': instance.avatar,
      'updated_at': instance.updated_at?.toIso8601String(),
      'created_at': instance.created_at?.toIso8601String(),
    };
