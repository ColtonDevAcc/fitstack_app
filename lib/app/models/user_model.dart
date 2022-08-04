import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String user_id,
    required String email,
    required String display_name,
    required String first_name,
    required String last_name,
    required DateTime date_of_birth,
    required bool isAnonymous,
    required bool isEmailVerified,
    required String? phone_number,
    String? photo_url,
    int? age,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  factory User.empty() => User(
        display_name: "",
        user_id: "",
        email: "",
        first_name: "",
        last_name: "",
        date_of_birth: DateTime.now(),
        isAnonymous: false,
        isEmailVerified: false,
        phone_number: null,
        photo_url: null,
        age: 0,
      );
  factory User.fromFirebase(fb.User user) => User(
        user_id: user.uid,
        email: user.email ?? "",
        display_name: user.displayName ?? "",
        first_name: "",
        last_name: "",
        date_of_birth: DateTime.now(),
        isAnonymous: user.isAnonymous,
        isEmailVerified: user.emailVerified,
        phone_number: '',
      );
}
