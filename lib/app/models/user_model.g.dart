// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserCWProxy {
  User age(int? age);

  User created_at(int? created_at);

  User date_of_birth(DateTime date_of_birth);

  User display_name(String display_name);

  User email(String email);

  User email_verified(bool email_verified);

  User first_name(String first_name);

  User last_name(String last_name);

  User password(String? password);

  User phone_number(String? phone_number);

  User photo_url(String? photo_url);

  User refresh_token(String? refresh_token);

  User updated_at(String? updated_at);

  User user_friendships(List<dynamic>? user_friendships);

  User user_id(String? user_id);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `User(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// User(...).copyWith(id: 12, name: "My name")
  /// ````
  User call({
    int? age,
    int? created_at,
    DateTime? date_of_birth,
    String? display_name,
    String? email,
    bool? email_verified,
    String? first_name,
    String? last_name,
    String? password,
    String? phone_number,
    String? photo_url,
    String? refresh_token,
    String? updated_at,
    List<dynamic>? user_friendships,
    String? user_id,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUser.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUser.copyWith.fieldName(...)`
class _$UserCWProxyImpl implements _$UserCWProxy {
  final User _value;

  const _$UserCWProxyImpl(this._value);

  @override
  User age(int? age) => this(age: age);

  @override
  User created_at(int? created_at) => this(created_at: created_at);

  @override
  User date_of_birth(DateTime date_of_birth) =>
      this(date_of_birth: date_of_birth);

  @override
  User display_name(String display_name) => this(display_name: display_name);

  @override
  User email(String email) => this(email: email);

  @override
  User email_verified(bool email_verified) =>
      this(email_verified: email_verified);

  @override
  User first_name(String first_name) => this(first_name: first_name);

  @override
  User last_name(String last_name) => this(last_name: last_name);

  @override
  User password(String? password) => this(password: password);

  @override
  User phone_number(String? phone_number) => this(phone_number: phone_number);

  @override
  User photo_url(String? photo_url) => this(photo_url: photo_url);

  @override
  User refresh_token(String? refresh_token) =>
      this(refresh_token: refresh_token);

  @override
  User updated_at(String? updated_at) => this(updated_at: updated_at);

  @override
  User user_friendships(List<dynamic>? user_friendships) =>
      this(user_friendships: user_friendships);

  @override
  User user_id(String? user_id) => this(user_id: user_id);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `User(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// User(...).copyWith(id: 12, name: "My name")
  /// ````
  User call({
    Object? age = const $CopyWithPlaceholder(),
    Object? created_at = const $CopyWithPlaceholder(),
    Object? date_of_birth = const $CopyWithPlaceholder(),
    Object? display_name = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? email_verified = const $CopyWithPlaceholder(),
    Object? first_name = const $CopyWithPlaceholder(),
    Object? last_name = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? phone_number = const $CopyWithPlaceholder(),
    Object? photo_url = const $CopyWithPlaceholder(),
    Object? refresh_token = const $CopyWithPlaceholder(),
    Object? updated_at = const $CopyWithPlaceholder(),
    Object? user_friendships = const $CopyWithPlaceholder(),
    Object? user_id = const $CopyWithPlaceholder(),
  }) {
    return User(
      age: age == const $CopyWithPlaceholder()
          ? _value.age
          // ignore: cast_nullable_to_non_nullable
          : age as int?,
      created_at: created_at == const $CopyWithPlaceholder()
          ? _value.created_at
          // ignore: cast_nullable_to_non_nullable
          : created_at as int?,
      date_of_birth:
          date_of_birth == const $CopyWithPlaceholder() || date_of_birth == null
              ? _value.date_of_birth
              // ignore: cast_nullable_to_non_nullable
              : date_of_birth as DateTime,
      display_name:
          display_name == const $CopyWithPlaceholder() || display_name == null
              ? _value.display_name
              // ignore: cast_nullable_to_non_nullable
              : display_name as String,
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      email_verified: email_verified == const $CopyWithPlaceholder() ||
              email_verified == null
          ? _value.email_verified
          // ignore: cast_nullable_to_non_nullable
          : email_verified as bool,
      first_name:
          first_name == const $CopyWithPlaceholder() || first_name == null
              ? _value.first_name
              // ignore: cast_nullable_to_non_nullable
              : first_name as String,
      last_name: last_name == const $CopyWithPlaceholder() || last_name == null
          ? _value.last_name
          // ignore: cast_nullable_to_non_nullable
          : last_name as String,
      password: password == const $CopyWithPlaceholder()
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String?,
      phone_number: phone_number == const $CopyWithPlaceholder()
          ? _value.phone_number
          // ignore: cast_nullable_to_non_nullable
          : phone_number as String?,
      photo_url: photo_url == const $CopyWithPlaceholder()
          ? _value.photo_url
          // ignore: cast_nullable_to_non_nullable
          : photo_url as String?,
      refresh_token: refresh_token == const $CopyWithPlaceholder()
          ? _value.refresh_token
          // ignore: cast_nullable_to_non_nullable
          : refresh_token as String?,
      updated_at: updated_at == const $CopyWithPlaceholder()
          ? _value.updated_at
          // ignore: cast_nullable_to_non_nullable
          : updated_at as String?,
      user_friendships: user_friendships == const $CopyWithPlaceholder()
          ? _value.user_friendships
          // ignore: cast_nullable_to_non_nullable
          : user_friendships as List<dynamic>?,
      user_id: user_id == const $CopyWithPlaceholder()
          ? _value.user_id
          // ignore: cast_nullable_to_non_nullable
          : user_id as String?,
    );
  }
}

extension $UserCopyWith on User {
  /// Returns a callable class that can be used as follows: `instanceOfUser.copyWith(...)` or like so:`instanceOfUser.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UserCWProxy get copyWith => _$UserCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      password: json['password'] as String?,
      updated_at: json['updated_at'] as String?,
      created_at: json['created_at'] as int?,
      refresh_token: json['refresh_token'] as String?,
      user_friendships: json['user_friendships'] as List<dynamic>?,
      user_id: json['user_id'] as String?,
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
  'password': 'password',
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
      'password': instance.password,
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
