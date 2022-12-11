import 'package:FitStack/app/models/user/user_profile_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;

part 'user_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true, anyMap: true)
@CopyWith()
class User extends Equatable {
  final String? id;
  final String email;
  final String? password;
  final String first_name;
  final String last_name;
  final String? phone_number;
  final double? bmi_goal;
  final double? weight_goal;
  final DateTime date_of_birth;
  final bool email_verified;
  final DateTime? updated_at;
  final DateTime? created_at;
  final String? refresh_token;
  final UserProfile profile;

  User({
    this.bmi_goal,
    this.weight_goal,
    required this.profile,
    this.password,
    this.updated_at,
    this.created_at,
    this.refresh_token,
    this.id,
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.date_of_birth,
    required this.email_verified,
    this.phone_number,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        password,
        first_name,
        last_name,
        date_of_birth,
        email_verified,
        phone_number,
        profile,
      ];

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
  factory User.empty() => User(
        id: "",
        email: "",
        first_name: "",
        last_name: "",
        date_of_birth: DateTime.now(),
        email_verified: false,
        phone_number: null,
        password: '',
        created_at: DateTime.now(),
        refresh_token: '',
        updated_at: DateTime.now(),
        profile: UserProfile.empty(),
      );
  factory User.fromFirebase(fb.User user) => User(
        id: user.uid,
        email: user.email ?? "",
        first_name: "",
        last_name: "",
        password: "",
        date_of_birth: DateTime.now(),
        email_verified: user.emailVerified,
        phone_number: user.phoneNumber,
        created_at: user.metadata.creationTime,
        refresh_token: user.refreshToken ?? "",
        updated_at: user.metadata.lastSignInTime,
        profile: UserProfile.empty(),
      );
}

//  "profile": {
//         "id": "8uySBz11AfV9gf1VYlGRznOoZWr1",
//         "challenges": null,
//         "achievements": null,
//         "user_statistics": null,
//         "display_name": "ColtonDevAcc",
//         "fit_credits": 2,
//         "social_points": 20,
//         "days_logged_in_a_row": 2,
//         "avatar": null,
//         "created_at": "0001-01-01T00:00:00Z",
//         "updated_at": "0001-01-01T00:00:00Z",
//         "DeletedAt": null
// }