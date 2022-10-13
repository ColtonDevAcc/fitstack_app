import 'dart:developer';

import 'package:FitStack/app/models/friendship_model.dart';
import 'package:FitStack/app/repository/relationship_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'friendship_state.dart';

class FriendshipCubit extends Cubit<FriendshipState> {
  final RelationshipRepository relationshipRepository;

  FriendshipCubit({required this.relationshipRepository}) : super(FriendshipState(friends: []));

  Future<void> getFriends() async {
    try {
      String? token = await FirebaseAuth.instance.currentUser?.getIdToken(false);
      var friends = await relationshipRepository.getFriends(token: token!);
      emit(state.copyWith(friends: friends));
    } catch (e) {
      log("${e}");
    }
  }
}
