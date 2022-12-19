// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map json) => User(
      profile: UserProfile.fromJson(
          Map<String, dynamic>.from(json['profile'] as Map)),
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      dateOfBirth: DateTime.parse(json['date_of_birth'] as String),
      emailVerified: json['email_verified'] as bool,
      bmiGoal: (json['bmi_goal'] as num?)?.toDouble(),
      weightGoal: (json['weight_goal'] as num?)?.toDouble(),
      password: json['password'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      refreshToken: json['refresh_token'] as String?,
      id: json['id'] as String?,
      phoneNumber: json['phone_number'] as String?,
    );

const _$UserFieldMap = <String, String>{
  'id': 'id',
  'email': 'email',
  'password': 'password',
  'firstName': 'first_name',
  'lastName': 'last_name',
  'phoneNumber': 'phone_number',
  'bmiGoal': 'bmi_goal',
  'weightGoal': 'weight_goal',
  'dateOfBirth': 'date_of_birth',
  'emailVerified': 'email_verified',
  'updatedAt': 'updated_at',
  'createdAt': 'created_at',
  'refreshToken': 'refresh_token',
  'profile': 'profile',
};

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone_number': instance.phoneNumber,
      'bmi_goal': instance.bmiGoal,
      'weight_goal': instance.weightGoal,
      'date_of_birth': instance.dateOfBirth.toIso8601String(),
      'email_verified': instance.emailVerified,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'refresh_token': instance.refreshToken,
      'profile': instance.profile.toJson(),
    };
