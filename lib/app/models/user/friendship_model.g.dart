// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friendship_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Friendship _$FriendshipFromJson(Map json) => Friendship(
      id: json['id'] as String,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      sentTime: json['sent_time'] as String,
      responseTime: json['response_time'] as String?,
      accepted: json['accepted'] as bool,
      toUser: json['to_user'] as String,
      fromUser: json['from_user'] as String,
    );

const _$FriendshipFieldMap = <String, String>{
  'id': 'id',
  'fromUser': 'from_user',
  'toUser': 'to_user',
  'accepted': 'accepted',
  'sentTime': 'sent_time',
  'responseTime': 'response_time',
  'updatedAt': 'updated_at',
  'deletedAt': 'deleted_at',
};

Map<String, dynamic> _$FriendshipToJson(Friendship instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from_user': instance.fromUser,
      'to_user': instance.toUser,
      'accepted': instance.accepted,
      'sent_time': instance.sentTime,
      'response_time': instance.responseTime,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };
