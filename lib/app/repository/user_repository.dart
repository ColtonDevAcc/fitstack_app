import 'dart:developer';

import 'package:FitStack/app/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

class UserRepository {
  static String mainUrl = kDebugMode ? "https://devsvcs.motbdev.org/mobileapi/api/v1" : "https://svcs.museumofthebible.org/mobileapi/api/v1";
  static String meUrl = "/me";
  static String sendTokenToEmailUrl = "/reset-password-request";
  static String changePasswordUrl = "/change-password";

  final Dio dio = Dio();

  Future<User?> getUser({required token}) async {
    try {
      Response response = await dio.get(
        mainUrl + meUrl,
        options: Options(
          headers: {
            'Authorization': "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      } else {
        log("${response.statusCode}: ${response.statusMessage}");
        return null;
      }
    } catch (e) {
      log("error with /me route ${e.toString()}");
      return null;
    }
  }

  Future<String?> sendTokenToEmail({required email}) async {
    try {
      var response = await dio.post(
        mainUrl + sendTokenToEmailUrl,
        data: {"email": email},
      );

      return response.data['message'];
    } catch (e) {
      log("error with $sendTokenToEmailUrl route ${e.toString()}");
      return null;
    }
  }

  Future<String?> changePassword({required email, required token, required password}) async {
    try {
      var response = await dio.post(
        mainUrl + changePasswordUrl,
        data: {
          "email": email,
          "token": token,
          "password": password,
        },
      );

      return response.data['message'];
    } catch (e) {
      log("error with $changePasswordUrl route ${e.toString()}");
      return null;
    }
  }
}
