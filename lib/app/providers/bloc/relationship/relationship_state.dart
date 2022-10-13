part of 'relationship_bloc.dart';

class RelationshipState extends Equatable {
  final FriendshipFetchStatus status;
  final List<Friendship?>? friendship;
  const RelationshipState._({this.status = FriendshipFetchStatus.initial, this.friendship});

  const RelationshipState.Initial() : this._();
  const RelationshipState.Loaded(List<Friendship?>? friendship) : this._(status: FriendshipFetchStatus.loaded, friendship: friendship);
  const RelationshipState.Error() : this._(status: FriendshipFetchStatus.error);

  @override
  List<Object> get props => [status, friendship ?? []];
}
