// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      updated_at: json['updated_at'] as String?,
      created_at: json['created_at'] as String?,
      refresh_token: json['refresh_token'] as String?,
      user_friendships: json['user_friendships'] as List<dynamic>?,
      user_id: json['user_id'] as String,
      email: json['email'] as String,
      display_name: json['display_name'] as String,
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      date_of_birth: DateTime.parse(json['date_of_birth'] as String),
      email_verified: json['email_verified'] as bool,
      phone_number: json['phone_number'] as String?,
      photo_url: json['photo_url'] as String?,
      age: json['age'] as int?,
    );

const _$UserFieldMap = <String, String>{
  'user_id': 'user_id',
  'email': 'email',
  'display_name': 'display_name',
  'first_name': 'first_name',
  'last_name': 'last_name',
  'phone_number': 'phone_number',
  'date_of_birth': 'date_of_birth',
  'photo_url': 'photo_url',
  'user_friendships': 'user_friendships',
  'email_verified': 'email_verified',
  'age': 'age',
  'updated_at': 'updated_at',
  'created_at': 'created_at',
  'refresh_token': 'refresh_token',
};

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'user_id': instance.user_id,
      'email': instance.email,
      'display_name': instance.display_name,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'phone_number': instance.phone_number,
      'date_of_birth': instance.date_of_birth.toIso8601String(),
      'photo_url': instance.photo_url,
      'user_friendships': instance.user_friendships,
      'email_verified': instance.email_verified,
      'age': instance.age,
      'updated_at': instance.updated_at,
      'created_at': instance.created_at,
      'refresh_token': instance.refresh_token,
    };
