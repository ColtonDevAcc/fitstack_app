import 'package:FitStack/app/models/user/user_statistic_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_profile_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true, anyMap: true)
class UserProfile extends Equatable {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'display_name')
  final String displayName;
  @JsonKey(name: 'challenges')
  final List? challenges;
  @JsonKey(name: 'achievements')
  final List? achievements;
  @JsonKey(name: 'user_statistics')
  final UserStatistic? userStatistics;
  @JsonKey(name: 'friends')
  final List<UserProfile>? friends;
  @JsonKey(name: 'fit_credits')
  final int fitCredits;
  @JsonKey(name: 'social_points')
  final int socialPoints;
  @JsonKey(name: 'days_logged_in_a_row')
  final int loginStreak;
  @JsonKey(name: 'avatar')
  final String? avatar;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  const UserProfile({
    required this.displayName,
    required this.id,
    required this.challenges,
    required this.achievements,
    required this.fitCredits,
    required this.socialPoints,
    required this.loginStreak,
    required this.avatar,
    this.friends,
    this.userStatistics,
    this.updatedAt,
    this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        displayName,
        challenges,
        achievements,
        userStatistics,
        friends,
        fitCredits,
        socialPoints,
        loginStreak,
        updatedAt,
        avatar,
        createdAt,
      ];

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
  factory UserProfile.empty() => UserProfile(
        id: 'id',
        challenges: const [],
        achievements: const [],
        userStatistics: UserStatistic.empty(),
        fitCredits: 0,
        socialPoints: 0,
        loginStreak: 0,
        updatedAt: DateTime.now(),
        displayName: 'null',
        avatar: '',
        createdAt: DateTime.now(),
      );

  //copy with
  UserProfile copyWith({
    String? id,
    String? displayName,
    List? challenges,
    List? achievements,
    UserStatistic? userStatistics,
    List<UserProfile>? friends,
    int? fitCredits,
    int? socialPoints,
    int? loginStreak,
    String? avatar,
    DateTime? updatedAt,
    DateTime? createdAt,
  }) {
    return UserProfile(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      challenges: challenges ?? this.challenges,
      achievements: achievements ?? this.achievements,
      userStatistics: userStatistics ?? this.userStatistics,
      friends: friends ?? this.friends,
      fitCredits: fitCredits ?? this.fitCredits,
      socialPoints: socialPoints ?? this.socialPoints,
      loginStreak: loginStreak ?? this.loginStreak,
      avatar: avatar ?? this.avatar,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
