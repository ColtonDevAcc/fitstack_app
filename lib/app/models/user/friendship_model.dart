import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'friendship_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true, anyMap: true)
class Friendship extends Equatable {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'from_user')
  final String fromUser;
  @JsonKey(name: 'to_user')
  final String toUser;
  @JsonKey(name: 'accepted')
  final bool accepted;
  @JsonKey(name: 'sent_time')
  final String sentTime;
  @JsonKey(name: 'response_time')
  final String? responseTime;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @JsonKey(name: 'deleted_at')
  final DateTime? deletedAt;

  const Friendship({
    required this.id,
    this.updatedAt,
    this.deletedAt,
    required this.sentTime,
    this.responseTime,
    required this.accepted,
    required this.toUser,
    required this.fromUser,
  });

  @override
  List<Object?> get props => [toUser, fromUser, sentTime, responseTime, accepted, id, updatedAt, deletedAt];

  factory Friendship.fromJson(Map<String, dynamic> json) => _$FriendshipFromJson(json);
  Map<String, dynamic> toJson() => _$FriendshipToJson(this);
  factory Friendship.empty() => const Friendship(accepted: false, fromUser: '', sentTime: '', toUser: '', id: '');

  Friendship copyWith({
    String? id,
    String? fromUser,
    String? toUser,
    bool? accepted,
    String? sentTime,
    String? responseTime,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) {
    return Friendship(
      id: id ?? this.id,
      fromUser: fromUser ?? this.fromUser,
      toUser: toUser ?? this.toUser,
      accepted: accepted ?? this.accepted,
      sentTime: sentTime ?? this.sentTime,
      responseTime: responseTime ?? this.responseTime,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }
}
