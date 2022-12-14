// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map json) => UserProfile(
      friends: (json['friends'] as List<dynamic>?)
          ?.map(
              (e) => UserProfile.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      userStatistics: json['user_statistics'] == null
          ? null
          : UserStatistic.fromJson(
              Map<String, dynamic>.from(json['user_statistics'] as Map)),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      displayName: json['display_name'] as String,
      id: json['id'] as String,
      challenges: json['challenges'] as List<dynamic>?,
      achievements: json['achievements'] as List<dynamic>?,
      fitCredits: json['fit_credits'] as int,
      socialPoints: json['social_points'] as int,
      loginStreak: json['days_logged_in_a_row'] as int,
      avatar: json['avatar'] as String?,
    );

const _$UserProfileFieldMap = <String, String>{
  'id': 'id',
  'displayName': 'display_name',
  'challenges': 'challenges',
  'achievements': 'achievements',
  'userStatistics': 'user_statistics',
  'friends': 'friends',
  'fitCredits': 'fit_credits',
  'socialPoints': 'social_points',
  'loginStreak': 'days_logged_in_a_row',
  'avatar': 'avatar',
  'updatedAt': 'updated_at',
  'createdAt': 'created_at',
};

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'display_name': instance.displayName,
      'challenges': instance.challenges,
      'achievements': instance.achievements,
      'user_statistics': instance.userStatistics?.toJson(),
      'friends': instance.friends?.map((e) => e.toJson()).toList(),
      'fit_credits': instance.fitCredits,
      'social_points': instance.socialPoints,
      'days_logged_in_a_row': instance.loginStreak,
      'avatar': instance.avatar,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
    };
