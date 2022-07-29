// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      user_id: json['user_id'] as String,
      email: json['email'] as String,
      display_name: json['display_name'] as String,
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      dob: DateTime.parse(json['dob'] as String),
      isAnonymous: json['isAnonymous'] as bool,
      isEmailVerified: json['isEmailVerified'] as bool,
      phoneNumber: json['phoneNumber'] as String?,
      photo_url: json['photo_url'] as String?,
      age: json['age'] as int?,
    );

const _$$_UserFieldMap = <String, String>{
  'user_id': 'user_id',
  'email': 'email',
  'display_name': 'display_name',
  'first_name': 'first_name',
  'last_name': 'last_name',
  'dob': 'dob',
  'isAnonymous': 'isAnonymous',
  'isEmailVerified': 'isEmailVerified',
  'phoneNumber': 'phoneNumber',
  'photo_url': 'photo_url',
  'age': 'age',
};

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'user_id': instance.user_id,
      'email': instance.email,
      'display_name': instance.display_name,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'dob': instance.dob.toIso8601String(),
      'isAnonymous': instance.isAnonymous,
      'isEmailVerified': instance.isEmailVerified,
      'phoneNumber': instance.phoneNumber,
      'photo_url': instance.photo_url,
      'age': instance.age,
    };
