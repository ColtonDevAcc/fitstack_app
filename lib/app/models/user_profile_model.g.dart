// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserProfileCWProxy {
  UserProfile achievements(List<dynamic> achievements);

  UserProfile avatar(String? avatar);

  UserProfile challenges(List<dynamic> challenges);

  UserProfile daysLoggedInARow(int daysLoggedInARow);

  UserProfile display_name(String display_name);

  UserProfile fitCredits(int fitCredits);

  UserProfile id(String id);

  UserProfile socialPoints(int socialPoints);

  UserProfile updatedAt(DateTime updatedAt);

  UserProfile userStatistics(List<dynamic> userStatistics);

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
    int? daysLoggedInARow,
    String? display_name,
    int? fitCredits,
    String? id,
    int? socialPoints,
    DateTime? updatedAt,
    List<dynamic>? userStatistics,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUserProfile.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUserProfile.copyWith.fieldName(...)`
class _$UserProfileCWProxyImpl implements _$UserProfileCWProxy {
  final UserProfile _value;

  const _$UserProfileCWProxyImpl(this._value);

  @override
  UserProfile achievements(List<dynamic> achievements) =>
      this(achievements: achievements);

  @override
  UserProfile avatar(String? avatar) => this(avatar: avatar);

  @override
  UserProfile challenges(List<dynamic> challenges) =>
      this(challenges: challenges);

  @override
  UserProfile daysLoggedInARow(int daysLoggedInARow) =>
      this(daysLoggedInARow: daysLoggedInARow);

  @override
  UserProfile display_name(String display_name) =>
      this(display_name: display_name);

  @override
  UserProfile fitCredits(int fitCredits) => this(fitCredits: fitCredits);

  @override
  UserProfile id(String id) => this(id: id);

  @override
  UserProfile socialPoints(int socialPoints) =>
      this(socialPoints: socialPoints);

  @override
  UserProfile updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  UserProfile userStatistics(List<dynamic> userStatistics) =>
      this(userStatistics: userStatistics);

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
    Object? daysLoggedInARow = const $CopyWithPlaceholder(),
    Object? display_name = const $CopyWithPlaceholder(),
    Object? fitCredits = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? socialPoints = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
    Object? userStatistics = const $CopyWithPlaceholder(),
  }) {
    return UserProfile(
      achievements:
          achievements == const $CopyWithPlaceholder() || achievements == null
              ? _value.achievements
              // ignore: cast_nullable_to_non_nullable
              : achievements as List<dynamic>,
      avatar: avatar == const $CopyWithPlaceholder()
          ? _value.avatar
          // ignore: cast_nullable_to_non_nullable
          : avatar as String?,
      challenges:
          challenges == const $CopyWithPlaceholder() || challenges == null
              ? _value.challenges
              // ignore: cast_nullable_to_non_nullable
              : challenges as List<dynamic>,
      daysLoggedInARow: daysLoggedInARow == const $CopyWithPlaceholder() ||
              daysLoggedInARow == null
          ? _value.daysLoggedInARow
          // ignore: cast_nullable_to_non_nullable
          : daysLoggedInARow as int,
      display_name:
          display_name == const $CopyWithPlaceholder() || display_name == null
              ? _value.display_name
              // ignore: cast_nullable_to_non_nullable
              : display_name as String,
      fitCredits:
          fitCredits == const $CopyWithPlaceholder() || fitCredits == null
              ? _value.fitCredits
              // ignore: cast_nullable_to_non_nullable
              : fitCredits as int,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      socialPoints:
          socialPoints == const $CopyWithPlaceholder() || socialPoints == null
              ? _value.socialPoints
              // ignore: cast_nullable_to_non_nullable
              : socialPoints as int,
      updatedAt: updatedAt == const $CopyWithPlaceholder() || updatedAt == null
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime,
      userStatistics: userStatistics == const $CopyWithPlaceholder() ||
              userStatistics == null
          ? _value.userStatistics
          // ignore: cast_nullable_to_non_nullable
          : userStatistics as List<dynamic>,
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
      display_name: json['display_name'] as String,
      id: json['id'] as String,
      challenges: json['challenges'] as List<dynamic>,
      achievements: json['achievements'] as List<dynamic>,
      userStatistics: json['userStatistics'] as List<dynamic>,
      fitCredits: json['fitCredits'] as int,
      socialPoints: json['socialPoints'] as int,
      daysLoggedInARow: json['daysLoggedInARow'] as int,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      avatar: json['avatar'] as String?,
    );

const _$UserProfileFieldMap = <String, String>{
  'id': 'id',
  'display_name': 'display_name',
  'challenges': 'challenges',
  'achievements': 'achievements',
  'userStatistics': 'userStatistics',
  'fitCredits': 'fitCredits',
  'socialPoints': 'socialPoints',
  'daysLoggedInARow': 'daysLoggedInARow',
  'updatedAt': 'updatedAt',
  'avatar': 'avatar',
};

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'display_name': instance.display_name,
      'challenges': instance.challenges,
      'achievements': instance.achievements,
      'userStatistics': instance.userStatistics,
      'fitCredits': instance.fitCredits,
      'socialPoints': instance.socialPoints,
      'daysLoggedInARow': instance.daysLoggedInARow,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'avatar': instance.avatar,
    };
