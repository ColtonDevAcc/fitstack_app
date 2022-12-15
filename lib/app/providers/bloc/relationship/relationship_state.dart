part of 'relationship_bloc.dart';

class RelationshipState extends Equatable {
  final FriendshipFetchStatus status;
  final List<Friendship?>? friendship;
  const RelationshipState._({this.status = FriendshipFetchStatus.initial, this.friendship});

  const RelationshipState.initial() : this._();
  const RelationshipState.loaded(List<Friendship?>? friendship) : this._(status: FriendshipFetchStatus.loaded, friendship: friendship);
  const RelationshipState.error() : this._(status: FriendshipFetchStatus.error);

  @override
  List<Object> get props => [status, friendship ?? []];
}
