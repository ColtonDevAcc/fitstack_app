import 'dart:async';

import 'package:FitStack/app/models/user/friendship_model.dart';
import 'package:FitStack/app/repository/relationship_repository.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'relationship_event.dart';
part 'relationship_state.dart';

class RelationshipBloc extends Bloc<RelationshipEvent, RelationshipState> {
  final RelationshipRepository relationshipRepository;
  late StreamSubscription<FriendStream> authenticationStatusSubscription;

  RelationshipBloc({required this.relationshipRepository}) : super(const RelationshipState.initial()) {
    on<FriendshipError>(onFriendshipError);
    on<FriendshipLoaded>(onFriendsLoaded);
    authenticationStatusSubscription = relationshipRepository.friendStatus.listen((status) => add(FriendshipInitial()));
  }

  void onFriendshipError(FriendshipError event, Emitter<RelationshipState> emit) {}

  Future<void> onFriendsLoaded(FriendshipLoaded event, Emitter<RelationshipState> emit) async {
    // try {
    //   String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    //   List<Friendship?>? relationships = await relationshipRepository.getFriends(token: token!);
    //   emit(FriendshipLoaded(friends: relationships));
    // } catch (e) {}
  }

  Future<void> onFriendshipFetchStatusChanged(FriendshipStatusChanged event, Emitter<RelationshipState> emit) async {
    switch (event.status.status) {
      case FriendshipFetchStatus.initial:
        {
          final String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
          await relationshipRepository.getFriends(token: token!);
          return emit(const RelationshipState.initial());
        }
      case FriendshipFetchStatus.loaded:
        return emit(RelationshipState.loaded(event.status.friendship));
      case FriendshipFetchStatus.loading:
        return emit(const RelationshipState.error());
      case FriendshipFetchStatus.error:
        break;
    }
  }

  @override
  Future<void> close() {
    authenticationStatusSubscription.cancel();
    return super.close();
  }
}
