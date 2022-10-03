import 'dart:developer';

import 'package:FitStack/app/models/friendship_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';

class RelationshipRepository {
  final Dio dio = Dio();
  final storage = new FlutterSecureStorage();
  static String mainUrl = kDebugMode ? "http://localhost:8000" : "https://dev.fitstack.io";

  Future<List<Friendship?>?> getFriends({required token}) async {
    try {
      Response response = await dio.post(
        mainUrl + '/get-friends',
        options: Options(
          headers: {"Authorization": "Bearer ${token}"},
        ),
      );

      if (response.statusCode == 200) {
        print(response.data);
        response.data;
      }
    } on Error catch (e) {
      log('error: ${e}, stacktrace: ${e.stackTrace}');
      return null;
    }
  }
}
