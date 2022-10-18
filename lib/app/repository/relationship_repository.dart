import 'dart:async';
import 'dart:developer';

import 'package:FitStack/app/models/friendship_model.dart';
import 'package:FitStack/app/models/user_profile_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';

class RelationshipRepository {
  final Dio dio = Dio();
  final storage = new FlutterSecureStorage();
  static String mainUrl = kDebugMode ? "http://localhost:8000" : "https://dev.fitstack.io";
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

  void dispose() => controller.close();
}

class FriendStream {
  List<Friendship> friendship;
  FriendshipFetchStatus status;
  FriendStream({required this.friendship, required this.status});
}

enum FriendshipFetchStatus { initial, loading, error, loaded }
