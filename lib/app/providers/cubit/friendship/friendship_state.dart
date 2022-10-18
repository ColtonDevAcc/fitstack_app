part of 'friendship_cubit.dart';

class FriendshipState extends Equatable {
  final List<UserProfile?>? friends;
  FriendshipState({
    this.friends,
  });

  FriendshipState copyWith({List<UserProfile?>? friends}) {
    return FriendshipState(friends: friends ?? this.friends);
  }

  @override
  List<Object?> get props => [friends];
}
