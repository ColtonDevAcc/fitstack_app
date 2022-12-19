import 'package:FitStack/app/models/user/user_profile_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;

part 'user_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true, anyMap: true)
class User extends Equatable {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'password')
  final String? password;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @JsonKey(name: 'bmi_goal')
  final double? bmiGoal;
  @JsonKey(name: 'weight_goal')
  final double? weightGoal;
  @JsonKey(name: 'date_of_birth')
  final DateTime dateOfBirth;
  @JsonKey(name: 'email_verified')
  final bool emailVerified;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'refresh_token')
  final String? refreshToken;
  @JsonKey(name: 'profile')
  final UserProfile profile;

  const User({
    required this.profile,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.emailVerified,
    this.bmiGoal,
    this.weightGoal,
    this.password,
    this.updatedAt,
    this.createdAt,
    this.refreshToken,
    this.id,
    this.phoneNumber,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        password,
        firstName,
        lastName,
        dateOfBirth,
        emailVerified,
        phoneNumber,
        profile,
      ];

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
  factory User.empty() => User(
        id: "",
        email: "",
        firstName: "",
        lastName: "",
        dateOfBirth: DateTime.now(),
        emailVerified: false,
        password: '',
        createdAt: DateTime.now(),
        refreshToken: '',
        updatedAt: DateTime.now(),
        profile: UserProfile.empty(),
      );
  factory User.fromFirebase(fb.User user) => User(
        id: user.uid,
        email: user.email ?? "",
        firstName: "",
        lastName: "",
        password: "",
        dateOfBirth: DateTime.now(),
        emailVerified: user.emailVerified,
        phoneNumber: user.phoneNumber,
        createdAt: user.metadata.creationTime,
        refreshToken: user.refreshToken ?? "",
        updatedAt: user.metadata.lastSignInTime,
        profile: UserProfile.empty(),
      );
}
