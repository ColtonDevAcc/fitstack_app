import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'friendship_model.g.dart';

@JsonSerializable()
@CopyWith()
class Friendship extends Equatable {
  final String to_user;
  final String from_user;
  final String sent_time;
  final String? response_time;
  final bool accepted;

  Friendship({
    required this.sent_time,
    this.response_time,
    required this.accepted,
    required this.to_user,
    required this.from_user,
  });

  @override
  List<Object?> get props => [this.to_user, this.from_user, this.sent_time, this.response_time, this.accepted];

  factory Friendship.fromJson(Map<String, dynamic> json) => _$FriendshipFromJson(json);
  Map<String, dynamic> toJson() => _$FriendshipToJson(this);
  factory Friendship.empty() => Friendship(accepted: false, from_user: '', sent_time: '', to_user: '');
}
