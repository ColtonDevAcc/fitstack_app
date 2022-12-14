part of 'friendship_cubit.dart';

class FriendshipState extends Equatable {
  final List<UserProfile?>? friends;
  final List<UserProfile?>? friendsList;
  final bool showAddFriend;
  final UserProfile friend;

  const FriendshipState({
    required this.friendsList,
    required this.friend,
    required this.showAddFriend,
    required this.friends,
  });

  FriendshipState copyWith({List<UserProfile?>? friends, List<UserProfile?>? friendsList, bool? showAddFriend, UserProfile? friend}) {
    return FriendshipState(
      friends: friends ?? this.friends,
      showAddFriend: showAddFriend ?? this.showAddFriend,
      friend: friend ?? this.friend,
      friendsList: friendsList ?? this.friendsList,
    );
  }

  @override
  List<Object?> get props => [friends, showAddFriend, friend, friendsList];
}
