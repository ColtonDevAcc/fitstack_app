// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserProfileCWProxy {
  UserProfile friends(List<UserProfile>? friends);

  UserProfile user_statistics(UserStatistic? user_statistics);

  UserProfile updated_at(DateTime? updated_at);

  UserProfile created_at(DateTime? created_at);

  UserProfile display_name(String display_name);

  UserProfile id(String id);

  UserProfile challenges(List<dynamic>? challenges);

  UserProfile achievements(List<dynamic>? achievements);

  UserProfile fit_credits(int fit_credits);

  UserProfile social_points(int social_points);

  UserProfile days_logged_in_a_row(int days_logged_in_a_row);

  UserProfile avatar(String? avatar);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserProfile(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserProfile(...).copyWith(id: 12, name: "My name")
  /// ````
  UserProfile call({
    List<UserProfile>? friends,
    UserStatistic? user_statistics,
    DateTime? updated_at,
    DateTime? created_at,
    String? display_name,
    String? id,
    List<dynamic>? challenges,
    List<dynamic>? achievements,
    int? fit_credits,
    int? social_points,
    int? days_logged_in_a_row,
    String? avatar,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUserProfile.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUserProfile.copyWith.fieldName(...)`
class _$UserProfileCWProxyImpl implements _$UserProfileCWProxy {
  const _$UserProfileCWProxyImpl(this._value);

  final UserProfile _value;

  @override
  UserProfile friends(List<UserProfile>? friends) => this(friends: friends);

  @override
  UserProfile user_statistics(UserStatistic? user_statistics) =>
      this(user_statistics: user_statistics);

  @override
  UserProfile updated_at(DateTime? updated_at) => this(updated_at: updated_at);

  @override
  UserProfile created_at(DateTime? created_at) => this(created_at: created_at);

  @override
  UserProfile display_name(String display_name) =>
      this(display_name: display_name);

  @override
  UserProfile id(String id) => this(id: id);

  @override
  UserProfile challenges(List<dynamic>? challenges) =>
      this(challenges: challenges);

  @override
  UserProfile achievements(List<dynamic>? achievements) =>
      this(achievements: achievements);

  @override
  UserProfile fit_credits(int fit_credits) => this(fit_credits: fit_credits);

  @override
  UserProfile social_points(int social_points) =>
      this(social_points: social_points);

  @override
  UserProfile days_logged_in_a_row(int days_logged_in_a_row) =>
      this(days_logged_in_a_row: days_logged_in_a_row);

  @override
  UserProfile avatar(String? avatar) => this(avatar: avatar);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserProfile(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserProfile(...).copyWith(id: 12, name: "My name")
  /// ````
  UserProfile call({
    Object? friends = const $CopyWithPlaceholder(),
    Object? user_statistics = const $CopyWithPlaceholder(),
    Object? updated_at = const $CopyWithPlaceholder(),
    Object? created_at = const $CopyWithPlaceholder(),
    Object? display_name = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? challenges = const $CopyWithPlaceholder(),
    Object? achievements = const $CopyWithPlaceholder(),
    Object? fit_credits = const $CopyWithPlaceholder(),
    Object? social_points = const $CopyWithPlaceholder(),
    Object? days_logged_in_a_row = const $CopyWithPlaceholder(),
    Object? avatar = const $CopyWithPlaceholder(),
  }) {
    return UserProfile(
      friends: friends == const $CopyWithPlaceholder()
          ? _value.friends
          // ignore: cast_nullable_to_non_nullable
          : friends as List<UserProfile>?,
      user_statistics: user_statistics == const $CopyWithPlaceholder()
          ? _value.user_statistics
          // ignore: cast_nullable_to_non_nullable
          : user_statistics as UserStatistic?,
      updated_at: updated_at == const $CopyWithPlaceholder()
          ? _value.updated_at
          // ignore: cast_nullable_to_non_nullable
          : updated_at as DateTime?,
      created_at: created_at == const $CopyWithPlaceholder()
          ? _value.created_at
          // ignore: cast_nullable_to_non_nullable
          : created_at as DateTime?,
      display_name:
          display_name == const $CopyWithPlaceholder() || display_name == null
              // ignore: unnecessary_non_null_assertion
              ? _value.display_name!
              // ignore: cast_nullable_to_non_nullable
              : display_name as String,
      id: id == const $CopyWithPlaceholder() || id == null
          // ignore: unnecessary_non_null_assertion
          ? _value.id!
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      challenges: challenges == const $CopyWithPlaceholder()
          ? _value.challenges
          // ignore: cast_nullable_to_non_nullable
          : challenges as List<dynamic>?,
      achievements: achievements == const $CopyWithPlaceholder()
          ? _value.achievements
          // ignore: cast_nullable_to_non_nullable
          : achievements as List<dynamic>?,
      fit_credits:
          fit_credits == const $CopyWithPlaceholder() || fit_credits == null
              // ignore: unnecessary_non_null_assertion
              ? _value.fit_credits!
              // ignore: cast_nullable_to_non_nullable
              : fit_credits as int,
      social_points:
          social_points == const $CopyWithPlaceholder() || social_points == null
              // ignore: unnecessary_non_null_assertion
              ? _value.social_points!
              // ignore: cast_nullable_to_non_nullable
              : social_points as int,
      days_logged_in_a_row:
          days_logged_in_a_row == const $CopyWithPlaceholder() ||
                  days_logged_in_a_row == null
              // ignore: unnecessary_non_null_assertion
              ? _value.days_logged_in_a_row!
              // ignore: cast_nullable_to_non_nullable
              : days_logged_in_a_row as int,
      avatar: avatar == const $CopyWithPlaceholder()
          ? _value.avatar
          // ignore: cast_nullable_to_non_nullable
          : avatar as String?,
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

UserProfile _$UserProfileFromJson(Map json) => UserProfile(
      friends: (json['friends'] as List<dynamic>?)
          ?.map(
              (e) => UserProfile.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      user_statistics: json['user_statistics'] == null
          ? null
          : UserStatistic.fromJson(
              Map<String, dynamic>.from(json['user_statistics'] as Map)),
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
      'user_statistics': instance.user_statistics?.toJson(),
      'friends': instance.friends?.map((e) => e.toJson()).toList(),
      'fit_credits': instance.fit_credits,
      'social_points': instance.social_points,
      'days_logged_in_a_row': instance.days_logged_in_a_row,
      'avatar': instance.avatar,
      'updated_at': instance.updated_at?.toIso8601String(),
      'created_at': instance.created_at?.toIso8601String(),
    };
