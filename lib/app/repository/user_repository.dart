import 'dart:developer';

import 'package:FitStack/app/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

class UserRepository {
  static String mainUrl = kDebugMode ? "http://localhost:8000" : "https://dev.fitstack.io";
  final Dio dio = Dio();

  Future<User?> getUser({required token}) async {
    try {
      Response response = await dio.post(
        mainUrl + '/user/signin',
        options: Options(
          headers: {"Authorization": "Bearer ${token}"},
        ),
      );

      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      } else {
        log("${response.statusCode}: ${response.statusMessage}");
        return null;
      }
    } on Error catch (e) {
      log('error: ${e}, stacktrace: ${e.stackTrace}');
      return null;
    }
  }
}
