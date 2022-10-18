import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'user_profile_model.g.dart';

@JsonSerializable()
@CopyWith()
class UserProfile extends Equatable {
  final String id;
  final String display_name;
  final List challenges;
  final List achievements;
  final List userStatistics;
  final int fitCredits;
  final int socialPoints;
  final int daysLoggedInARow;
  final DateTime updatedAt;
  final String? avatar;
  UserProfile({
    required this.display_name,
    required this.id,
    required this.challenges,
    required this.achievements,
    required this.userStatistics,
    required this.fitCredits,
    required this.socialPoints,
    required this.daysLoggedInARow,
    required this.updatedAt,
    this.avatar,
  });

  @override
  List<Object?> get props => [];

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
  factory UserProfile.empty() => UserProfile(
        id: 'id',
        challenges: [],
        achievements: [],
        userStatistics: [],
        fitCredits: 0,
        socialPoints: 0,
        daysLoggedInARow: 0,
        updatedAt: DateTime.now(),
        display_name: '',
      );
}

	// Id               string           `json:"id"`
	// Challenges       []*Challenge     `json:"challenges"`
	// Achievements     []*Achievement   `json:"achievements"`
	// Statistics       []*UserStatistic `json:"user_statistics"`
	// FitCredit        int              `json:"fit_credits"`
	// SocialPoints     int              `json:"social_points"`
	// DaysLoggedInARow int              `json:"days_logged_in_a_row"`
	// UpdatedAt        *time.Time       `json:"updated_at"`
	// Avatar           string           `json:"avatar"`