import 'dart:async';
import 'dart:developer';

import 'package:FitStack/app/models/user/friendship_model.dart';
import 'package:FitStack/app/models/user/user_profile_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';

class RelationshipRepository {
  final Dio dio = Dio();
  final storage = new FlutterSecureStorage();
  static String mainUrl = kDebugMode ? "http://localhost:8081" : "https://dev.fitstack.io";
  final controller = StreamController<FriendStream>.broadcast();

  RelationshipRepository();

  //! token section start
  Stream<FriendStream> get friendStatus async* {
    yield FriendStream(friendship: [], status: FriendshipFetchStatus.initial);
    yield* controller.stream;
  }

  Future<List<UserProfile?>?> getFriends({required String token}) async {
    try {
      controller.add(FriendStream(friendship: [], status: FriendshipFetchStatus.loading));
      Response response = await dio.get(
        mainUrl + '/friendship/get-friends',
        options: Options(
          headers: {"Authorization": "Bearer ${token}"},
        ),
      );

      if (response.statusCode == 200) {
        List responseJson = response.data as List;

        var friends = responseJson.map((e) => UserProfile.fromJson(e)).toList();
        return friends;
      } else {
        log("error");
      }
    } on Error catch (e) {
      controller.add(FriendStream(friendship: [], status: FriendshipFetchStatus.error));
      log('error: ${e}, stacktrace: ${e.stackTrace}');
      return null;
    }
    return null;
  }

  Future<List<UserProfile?>?> getFriendsList({required String token}) async {
    try {
      controller.add(FriendStream(friendship: [], status: FriendshipFetchStatus.loading));
      Response response = await dio.get(
        mainUrl + '/friendship/get-friends-list',
        options: Options(
          headers: {"Authorization": "Bearer ${token}"},
        ),
      );

      if (response.statusCode == 200) {
        List responseJson = response.data as List;

        var friends = responseJson.map((e) => UserProfile.fromJson(e)).toList();
        return friends;
      } else {
        log("error");
      }
    } on Error catch (e) {
      controller.add(FriendStream(friendship: [], status: FriendshipFetchStatus.error));
      log('error: ${e}, stacktrace: ${e.stackTrace}');
      return null;
    }
    return null;
  }

  Future<UserProfile?> getFriend({required String token, required String email}) async {
    try {
      controller.add(FriendStream(friendship: [], status: FriendshipFetchStatus.loading));
      Response response = await dio.post(mainUrl + '/friendship/get-friend',
          options: Options(
            headers: {"Authorization": "Bearer ${token}"},
          ),
          data: {"email": email});

      if (response.statusCode == 200) {
        var friend = UserProfile.fromJson(response.data);
        return friend;
      } else {
        log("error");
      }
    } on Error catch (e) {
      controller.add(FriendStream(friendship: [], status: FriendshipFetchStatus.error));
      log('error: ${e}, stacktrace: ${e.stackTrace}');
      return null;
    }
    return null;
  }

  Future<void> addFriend({required String token, required String uid}) async {
    try {
      controller.add(FriendStream(friendship: [], status: FriendshipFetchStatus.loading));
      Response response = await dio.post(mainUrl + '/friendship/add',
          options: Options(
            headers: {"Authorization": "Bearer ${token}"},
          ),
          data: {"to_user": uid});

      if (response.statusCode != 200) {
        throw Error();
      }
    } on Error catch (e) {
      controller.add(FriendStream(friendship: [], status: FriendshipFetchStatus.error));
      log('error: ${e}, stacktrace: ${e.stackTrace}');
      return null;
    }
    return null;
  }

  void dispose() => controller.close();
}

class FriendStream {
  List<Friendship> friendship;
  FriendshipFetchStatus status;
  FriendStream({required this.friendship, required this.status});
}

enum FriendshipFetchStatus { initial, loading, error, loaded }
