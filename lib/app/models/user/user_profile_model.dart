import 'package:FitStack/app/models/user/user_statistic_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'user_profile_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true, anyMap: true)
@CopyWith()
class UserProfile extends Equatable {
  final String id;
  final String display_name;
  final List? challenges;
  final List? achievements;
  final UserStatistic? user_statistics;
  final List<UserProfile>? friends;
  final int fit_credits;
  final int social_points;
  final int days_logged_in_a_row;
  final String? avatar;
  final DateTime? updated_at;
  final DateTime? created_at;
  UserProfile({
    this.friends,
    this.user_statistics,
    this.updated_at,
    this.created_at,
    required this.display_name,
    required this.id,
    required this.challenges,
    required this.achievements,
    required this.fit_credits,
    required this.social_points,
    required this.days_logged_in_a_row,
    required this.avatar,
  });

  @override
  List<Object?> get props => [
        id,
        display_name,
        challenges,
        achievements,
        user_statistics,
        friends,
        fit_credits,
        social_points,
        days_logged_in_a_row,
        updated_at,
        avatar,
        created_at,
      ];

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
  factory UserProfile.empty() => UserProfile(
        id: 'id',
        challenges: [],
        achievements: [],
        user_statistics: UserStatistic.empty(),
        fit_credits: 0,
        social_points: 0,
        days_logged_in_a_row: 0,
        updated_at: DateTime.now(),
        display_name: 'null',
        avatar: '',
        created_at: DateTime.now(),
      );
}
