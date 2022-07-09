import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class User extends Equatable {
  final String email;
  final String name;
  final String photo;
  final String displayName;
  final bool isAnonymous;
  final bool isEmailVerified;
  final UserMetadata? metadata;
  final String phoneNumber;
  final String photoUrl;
  final String providerData;
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
    providerData: "",
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
}
