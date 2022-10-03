part of 'relationship_bloc.dart';

class RelationshipState extends Equatable {
  final List<Friendship> friendship;
  const RelationshipState(this.friendship);

  @override
  List<Object> get props => [this.friendship];
}
