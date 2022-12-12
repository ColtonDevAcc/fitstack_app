// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserCWProxy {
  User bmi_goal(double? bmi_goal);

  User weight_goal(double? weight_goal);

  User profile(UserProfile profile);

  User password(String? password);

  User updated_at(DateTime? updated_at);

  User created_at(DateTime? created_at);

  User refresh_token(String? refresh_token);

  User id(String? id);

  User email(String email);

  User first_name(String first_name);

  User last_name(String last_name);

  User date_of_birth(DateTime date_of_birth);

  User email_verified(bool email_verified);

  User phone_number(String? phone_number);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `User(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// User(...).copyWith(id: 12, name: "My name")
  /// ````
  User call({
    double? bmi_goal,
    double? weight_goal,
    UserProfile? profile,
    String? password,
    DateTime? updated_at,
    DateTime? created_at,
    String? refresh_token,
    String? id,
    String? email,
    String? first_name,
    String? last_name,
    DateTime? date_of_birth,
    bool? email_verified,
    String? phone_number,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUser.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUser.copyWith.fieldName(...)`
class _$UserCWProxyImpl implements _$UserCWProxy {
  const _$UserCWProxyImpl(this._value);

  final User _value;

  @override
  User bmi_goal(double? bmi_goal) => this(bmi_goal: bmi_goal);

  @override
  User weight_goal(double? weight_goal) => this(weight_goal: weight_goal);

  @override
  User profile(UserProfile profile) => this(profile: profile);

  @override
  User password(String? password) => this(password: password);

  @override
  User updated_at(DateTime? updated_at) => this(updated_at: updated_at);

  @override
  User created_at(DateTime? created_at) => this(created_at: created_at);

  @override
  User refresh_token(String? refresh_token) =>
      this(refresh_token: refresh_token);

  @override
  User id(String? id) => this(id: id);

  @override
  User email(String email) => this(email: email);

  @override
  User first_name(String first_name) => this(first_name: first_name);

  @override
  User last_name(String last_name) => this(last_name: last_name);

  @override
  User date_of_birth(DateTime date_of_birth) =>
      this(date_of_birth: date_of_birth);

  @override
  User email_verified(bool email_verified) =>
      this(email_verified: email_verified);

  @override
  User phone_number(String? phone_number) => this(phone_number: phone_number);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `User(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// User(...).copyWith(id: 12, name: "My name")
  /// ````
  User call({
    Object? bmi_goal = const $CopyWithPlaceholder(),
    Object? weight_goal = const $CopyWithPlaceholder(),
    Object? profile = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? updated_at = const $CopyWithPlaceholder(),
    Object? created_at = const $CopyWithPlaceholder(),
    Object? refresh_token = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? first_name = const $CopyWithPlaceholder(),
    Object? last_name = const $CopyWithPlaceholder(),
    Object? date_of_birth = const $CopyWithPlaceholder(),
    Object? email_verified = const $CopyWithPlaceholder(),
    Object? phone_number = const $CopyWithPlaceholder(),
  }) {
    return User(
      bmi_goal: bmi_goal == const $CopyWithPlaceholder()
          ? _value.bmi_goal
          // ignore: cast_nullable_to_non_nullable
          : bmi_goal as double?,
      weight_goal: weight_goal == const $CopyWithPlaceholder()
          ? _value.weight_goal
          // ignore: cast_nullable_to_non_nullable
          : weight_goal as double?,
      profile: profile == const $CopyWithPlaceholder() || profile == null
          // ignore: unnecessary_non_null_assertion
          ? _value.profile!
          // ignore: cast_nullable_to_non_nullable
          : profile as UserProfile,
      password: password == const $CopyWithPlaceholder()
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String?,
      updated_at: updated_at == const $CopyWithPlaceholder()
          ? _value.updated_at
          // ignore: cast_nullable_to_non_nullable
          : updated_at as DateTime?,
      created_at: created_at == const $CopyWithPlaceholder()
          ? _value.created_at
          // ignore: cast_nullable_to_non_nullable
          : created_at as DateTime?,
      refresh_token: refresh_token == const $CopyWithPlaceholder()
          ? _value.refresh_token
          // ignore: cast_nullable_to_non_nullable
          : refresh_token as String?,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      email: email == const $CopyWithPlaceholder() || email == null
          // ignore: unnecessary_non_null_assertion
          ? _value.email!
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      first_name:
          first_name == const $CopyWithPlaceholder() || first_name == null
              // ignore: unnecessary_non_null_assertion
              ? _value.first_name!
              // ignore: cast_nullable_to_non_nullable
              : first_name as String,
      last_name: last_name == const $CopyWithPlaceholder() || last_name == null
          // ignore: unnecessary_non_null_assertion
          ? _value.last_name!
          // ignore: cast_nullable_to_non_nullable
          : last_name as String,
      date_of_birth:
          date_of_birth == const $CopyWithPlaceholder() || date_of_birth == null
              // ignore: unnecessary_non_null_assertion
              ? _value.date_of_birth!
              // ignore: cast_nullable_to_non_nullable
              : date_of_birth as DateTime,
      email_verified: email_verified == const $CopyWithPlaceholder() ||
              email_verified == null
          // ignore: unnecessary_non_null_assertion
          ? _value.email_verified!
          // ignore: cast_nullable_to_non_nullable
          : email_verified as bool,
      phone_number: phone_number == const $CopyWithPlaceholder()
          ? _value.phone_number
          // ignore: cast_nullable_to_non_nullable
          : phone_number as String?,
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

User _$UserFromJson(Map json) => User(
      bmi_goal: (json['bmi_goal'] as num?)?.toDouble(),
      weight_goal: (json['weight_goal'] as num?)?.toDouble(),
      profile: UserProfile.fromJson(
          Map<String, dynamic>.from(json['profile'] as Map)),
      password: json['password'] as String?,
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      refresh_token: json['refresh_token'] as String?,
      id: json['id'] as String?,
      email: json['email'] as String,
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      date_of_birth: DateTime.parse(json['date_of_birth'] as String),
      email_verified: json['email_verified'] as bool,
      phone_number: json['phone_number'] as String?,
    );

const _$UserFieldMap = <String, String>{
  'id': 'id',
  'email': 'email',
  'password': 'password',
  'first_name': 'first_name',
  'last_name': 'last_name',
  'phone_number': 'phone_number',
  'bmi_goal': 'bmi_goal',
  'weight_goal': 'weight_goal',
  'date_of_birth': 'date_of_birth',
  'email_verified': 'email_verified',
  'updated_at': 'updated_at',
  'created_at': 'created_at',
  'refresh_token': 'refresh_token',
  'profile': 'profile',
};

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'phone_number': instance.phone_number,
      'bmi_goal': instance.bmi_goal,
      'weight_goal': instance.weight_goal,
      'date_of_birth': instance.date_of_birth.toIso8601String(),
      'email_verified': instance.email_verified,
      'updated_at': instance.updated_at?.toIso8601String(),
      'created_at': instance.created_at?.toIso8601String(),
      'refresh_token': instance.refresh_token,
      'profile': instance.profile.toJson(),
    };
