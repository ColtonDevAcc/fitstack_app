import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;

part 'user_model.g.dart';

@JsonSerializable()
@CopyWith()
class User extends Equatable {
  final String? user_id;
  final String email;
  final String? password;
  final String? display_name;
  final String first_name;
  final String last_name;
  final String? phone_number;
  final DateTime date_of_birth;
  final bool email_verified;
  final DateTime? updated_at;
  final DateTime? created_at;
  final String? refresh_token;

  User({
    this.password,
    this.updated_at,
    this.created_at,
    this.refresh_token,
    this.user_id,
    required this.email,
    required this.display_name,
    required this.first_name,
    required this.last_name,
    required this.date_of_birth,
    required this.email_verified,
    this.phone_number,
  });

  @override
  List<Object?> get props => [
        user_id,
        email,
        password,
        display_name,
        first_name,
        last_name,
        date_of_birth,
        email_verified,
        phone_number,
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
        password: '',
        created_at: DateTime.now(),
        refresh_token: '',
        updated_at: DateTime.now(),
      );
  factory User.fromFirebase(fb.User user) => User(
        user_id: user.uid,
        email: user.email ?? "",
        display_name: user.displayName ?? "",
        first_name: "",
        last_name: "",
        password: "",
        date_of_birth: DateTime.now(),
        email_verified: user.emailVerified,
        phone_number: user.phoneNumber,
        created_at: user.metadata.creationTime,
        refresh_token: user.refreshToken ?? "",
        updated_at: user.metadata.lastSignInTime,
      );
}
