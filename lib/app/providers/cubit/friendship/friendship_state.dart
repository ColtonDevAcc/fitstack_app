part of 'friendship_cubit.dart';

class FriendshipState extends Equatable {
  final List<User?>? friends;
  FriendshipState({
    this.friends,
  });

  FriendshipState copyWith({List<User?>? friends}) {
    return FriendshipState(friends: friends ?? this.friends);
  }

  @override
  List<Object?> get props => [friends];
}
