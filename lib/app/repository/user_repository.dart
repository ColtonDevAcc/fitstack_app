import 'dart:developer';
import 'dart:io';

import 'package:FitStack/app/models/user_model.dart';
import 'package:FitStack/app/models/user_profile_model.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

class UserRepository {
  static String mainUrl = kDebugMode ? "http://10.0.2.2:8000" : "https://dev.fitstack.io";
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

  Future<String?> updateProfileAvatar({required String token, required File file}) async {
    try {
      FormData data = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
        ),
      });

      Response response = await dio.post(
        mainUrl + '/user/update-avatar',
        options: Options(
          headers: {
            "Authorization": "Bearer ${token}",
          },
        ),
        data: data,
      );

      if (response.statusCode == 200) {
      } else {
        return response.data;
      }
    } on Error catch (e) {
      log('error: ${e}, stacktrace: ${e.stackTrace}');
    }
    return null;
  }

  Future<UserProfile> getUserProfile({required String token}) async {
    try {
      Response response = await dio.get(
        mainUrl + '/user/profile',
        options: Options(
          headers: {
            "Authorization": "Bearer ${token}",
          },
        ),
      );

      if (response.statusCode == 200) {
      } else {
        return UserProfile.fromJson(response.data);
      }
    } on Error catch (e) {
      log('error: ${e}, stacktrace: ${e.stackTrace}');
    }
    return UserProfile.empty();
  }
}
