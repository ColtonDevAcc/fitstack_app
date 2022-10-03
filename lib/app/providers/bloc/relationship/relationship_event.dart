part of 'relationship_bloc.dart';

abstract class RelationshipEvent extends Equatable {
  const RelationshipEvent();

  @override
  List<Object> get props => [];
}

class AddFriend extends RelationshipEvent {}

class RemoveFriend extends RelationshipEvent {}

class AddGroup extends RelationshipEvent {}

class RemoveGroup extends RelationshipEvent {}
