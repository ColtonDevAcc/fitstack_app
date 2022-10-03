import 'package:FitStack/app/models/friendship_model.dart';
import 'package:FitStack/app/repository/relationship_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'relationship_event.dart';
part 'relationship_state.dart';

class RelationshipBloc extends Bloc<RelationshipEvent, RelationshipState> {
  final RelationshipRepository relationshipRepository;

  RelationshipBloc({required this.relationshipRepository}) : super(RelationshipState([])) {
    on<AddFriend>(onAddFriend);
    on<RemoveFriend>(onRemoveFriend);
    on<AddGroup>(onAddGroup);
    on<RemoveGroup>(onRemoveGroup);
  }
}

void onAddFriend(AddFriend event, Emitter<RelationshipState> emit) {}

void onRemoveFriend(RemoveFriend event, Emitter<RelationshipState> emit) {}

void onAddGroup(AddGroup event, Emitter<RelationshipState> emit) {}

void onRemoveGroup(RemoveGroup event, Emitter<RelationshipState> emit) {}
