import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;

part 'user_model.g.dart';

@JsonSerializable()
class User extends Equatable {
  final String user_id;
  final String email;
  final String display_name;
  final String first_name;
  final String last_name;
  final String? phone_number;
  final DateTime date_of_birth;
  final String? photo_url;
  final List? user_friendships;
  final bool email_verified;
  final int? age;
  final String? updated_at;
  final String? created_at;
  final String? refresh_token;

  User({
    this.updated_at,
    this.created_at,
    this.refresh_token,
    this.user_friendships,
    required this.user_id,
    required this.email,
    required this.display_name,
    required this.first_name,
    required this.last_name,
    required this.date_of_birth,
    required this.email_verified,
    this.phone_number,
    this.photo_url,
    this.age,
  });

  @override
  List<Object?> get props => [
        user_id,
        email,
        display_name,
        first_name,
        last_name,
        date_of_birth,
        email_verified,
        phone_number,
        photo_url,
        age,
      ];

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
  factory User.empty() => User(
        display_name: "",
        user_id: "",
        email: "",
        first_name: "",
        last_name: "",
        date_of_birth: DateTime.now(),
        email_verified: false,
        phone_number: null,
        photo_url: null,
        age: 0,
        created_at: '',
        refresh_token: '',
        updated_at: '',
      );
  factory User.fromFirebase(fb.User user) => User(
        user_id: user.uid,
        email: user.email ?? "",
        display_name: user.displayName ?? "",
        first_name: "",
        last_name: "",
        date_of_birth: DateTime.now(),
        email_verified: user.emailVerified,
        phone_number: user.phoneNumber,
        created_at: user.metadata.creationTime.toString(),
        refresh_token: user.refreshToken ?? "",
        updated_at: user.metadata.lastSignInTime.toString(),
      );
}
