import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;

class User extends Equatable {
  final String email;
  final String name;
  final String photo;
  final String displayName;
  final bool isAnonymous;
  final bool isEmailVerified;
  final fb.UserMetadata? metadata;
  final String phoneNumber;
  final String photoUrl;
  final List<fb.UserInfo> providerData;
  final String providerId;
  final String userId;

  const User({
    required this.email,
    required this.name,
    required this.photo,
    required this.displayName,
    required this.isAnonymous,
    required this.isEmailVerified,
    required this.metadata,
    required this.phoneNumber,
    required this.photoUrl,
    required this.providerData,
    required this.providerId,
    required this.userId,
  });

  static const empty = User(
    email: 'email',
    name: 'name',
    photo: 'photo',
    displayName: 'displayName',
    isAnonymous: false,
    isEmailVerified: false,
    metadata: null,
    phoneNumber: 'phoneNumber',
    photoUrl: 'photoUrl',
    providerData: [],
    providerId: "providerId",
    userId: "userId",
  );
  bool get isEmpty => this == User.empty;
  bool get isNotEmpty => this != User.empty;

  @override
  List<Object?> get props => [
        email,
        userId,
        name,
        photo,
        displayName,
        isAnonymous,
        isEmailVerified,
        metadata,
        phoneNumber,
        photoUrl,
        providerData,
        providerId,
        userId
      ];

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'photo': photo,
      'displayName': displayName,
      'isAnonymous': isAnonymous,
      'isEmailVerified': isEmailVerified,
      'metadata': metadata,
      'phoneNumber': phoneNumber,
      'photoUrl': photoUrl,
      'providerData': providerData,
      'providerId': providerId,
      'userId': userId,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      photo: map['photo'] ?? '',
      displayName: map['displayName'] ?? '',
      isAnonymous: map['isAnonymous'] ?? false,
      isEmailVerified: map['isEmailVerified'] ?? false,
      metadata: map['metadata'] != null ? (map['metadata']) : null,
      phoneNumber: map['phoneNumber'] ?? '',
      photoUrl: map['photoUrl'] ?? '',
      providerData: map['providerData'] ?? '',
      providerId: map['providerId'] ?? '',
      userId: map['userId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  factory User.fromFirebase(fb.User fb) {
    return User(
      email: fb.email ?? '',
      name: fb.displayName ?? '',
      photo: fb.photoURL ?? '',
      displayName: fb.displayName ?? '',
      isAnonymous: fb.isAnonymous,
      isEmailVerified: fb.emailVerified,
      metadata: fb.metadata,
      phoneNumber: fb.phoneNumber ?? '',
      photoUrl: fb.photoURL ?? '',
      providerData: fb.providerData,
      providerId: fb.uid,
      userId: fb.uid,
    );
  }
}
