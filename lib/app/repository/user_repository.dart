import 'dart:developer';
import 'dart:io';

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

  Future<void> updateProfileAvatar({required String token, required File file}) async {
    try {
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          file.path,
          filename: file.path.split("/").last,
        ),
      });

      Response response = await dio.post(
        mainUrl + '/user/update-avatar',
        options: Options(
          headers: {
            "Authorization": "Bearer ${token}",
          },
        ),
        data: formData,
      );
      log("${response.statusCode}: ${response.statusMessage}");

      if (response.statusCode == 200) {
      } else {
        log("${response.statusCode}: ${response.statusMessage}");
      }
    } on Error catch (e) {
      log('error: ${e}, stacktrace: ${e.stackTrace}');
    }
  }
}
