part of 'relationship_bloc.dart';

abstract class RelationshipEvent extends Equatable {
  const RelationshipEvent();

  @override
  List<Object> get props => [];
}

class InitialRelationships extends RelationshipEvent {}

class FriendshipError extends RelationshipEvent {}

class FriendshipInitial extends RelationshipEvent {}

class FriendshipLoaded extends RelationshipEvent {
  final List<Friendship?>? friends;
  const FriendshipLoaded({this.friends});

  @override
  List<Object> get props => [friends ?? []];
}

class FriendshipStatusChanged extends RelationshipEvent {
  final FriendStream status;
  const FriendshipStatusChanged(this.status);

  @override
  List<Object> get props => [status];
}
