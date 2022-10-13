part of 'friendship_cubit.dart';

class FriendshipState extends Equatable {
  final List<Friendship?>? friends;
  FriendshipState({
    this.friends,
  });

  FriendshipState copyWith({List<Friendship?>? friends}) {
    return FriendshipState(friends: friends ?? this.friends);
  }

  @override
  List<Object?> get props => [friends];
}
