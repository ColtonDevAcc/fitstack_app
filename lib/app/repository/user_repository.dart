import 'dart:developer';
import 'package:FitStack/app/models/user/user_model.dart';
import 'package:FitStack/app/models/user/user_profile_model.dart';
import 'package:FitStack/app/models/user/user_statistic_model.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class UserRepository {
  static String mainUrl = kDebugMode ? "http://192.168.0.203:8080" : "https://dev.fitstack.io";
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

  Future<String?> updateProfileAvatar({required String token, required XFile file}) async {
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
        log(response.data);
        return response.data;
      } else {}
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
        return UserProfile.fromJson(response.data);
      } else {}
    } on Error catch (e) {
      log('error: ${e}, stacktrace: ${e.stackTrace}');
    }
    return UserProfile.empty();
  }

  Future<UserStatistic> getStatistics({required String token}) async {
    try {
      Response response = await dio.get(
        mainUrl + '/user/statistics',
        options: Options(
          headers: {
            "Authorization": "Bearer ${token}",
          },
        ),
      );

      if (response.statusCode == 200) {
        return UserStatistic.fromJson(response.data);
      } else {
        log("${response.data}");
      }
    } on Error catch (e) {
      log('error: ${e}, stacktrace: ${e.stackTrace}');
    }
    return UserStatistic.empty();
  }

  Future<void> updateStatistics({required UserStatistic statistic, required String token}) async {
    try {
      log("${statistic.toJson()}");
      await dio.post(
        mainUrl + '/user/statistics',
        options: Options(
          headers: {
            "Authorization": "Bearer ${token}",
          },
        ),
        data: statistic.toJson(),
      );
    } catch (e) {
      log("$e");
    }
  }
}
