import 'dart:developer';

import 'package:FitStack/app/models/user_profile_model.dart';
import 'package:FitStack/app/repository/relationship_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'friendship_state.dart';

class FriendshipCubit extends Cubit<FriendshipState> {
  final RelationshipRepository relationshipRepository;

  FriendshipCubit({required this.relationshipRepository})
      : super(
          FriendshipState(
            friends: null,
            showAddFriend: false,
            friend: UserProfile.empty(),
            friendsList: null,
          ),
        );

  Future<void> getFriends() async {
    try {
      String? token = await fb.FirebaseAuth.instance.currentUser?.getIdToken(false);
      var friends = await relationshipRepository.getFriends(token: token!);
      emit(state.copyWith(friends: friends));
    } catch (e) {
      log("${e}");
    }
  }

  Future<void> getFriendsList() async {
    try {
      String? token = await fb.FirebaseAuth.instance.currentUser?.getIdToken(false);
      var friends = await relationshipRepository.getFriendsList(token: token!);
      emit(state.copyWith(friendsList: friends));
    } catch (e) {
      log("${e}");
    }
  }

  void setShowAddFriend(bool? show) {
    emit(state.copyWith(showAddFriend: show));
  }

  Future<void> getFriend({String? email, bool? clear}) async {
    if (clear == true) {
      emit(state.copyWith(friend: UserProfile.empty()));
    } else {
      try {
        String? token = await fb.FirebaseAuth.instance.currentUser?.getIdToken(false);
        var friend = await relationshipRepository.getFriend(token: token!, email: email!);
        emit(state.copyWith(friend: friend));
      } catch (e) {
        Fluttertoast.showToast(
          msg: "$e",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    }
  }

  Future<void> addFriend({required UserProfile friend}) async {
    try {
      String? token = await fb.FirebaseAuth.instance.currentUser?.getIdToken(false);
      await relationshipRepository.addFriend(token: token!, uid: friend.id);
      List<UserProfile?>? friendsList = []
        ..addAll(state.friends ?? [])
        ..add(friend);

      emit(state.copyWith(friendsList: friendsList));
    } catch (e) {
      Fluttertoast.showToast(
        msg: "$e",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}
