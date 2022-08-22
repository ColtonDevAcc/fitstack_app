import 'package:FitStack/app/models/user_model.dart';
import 'package:flutter/foundation.dart';

class UserRepository {
  User? _user;
  static String mainUrl = kDebugMode ? "https://dev.fitstack.io" : "https://api.fitstack.io";
  static String loginUrl = "/user/login";

  Future<User?> getUser() async {}
}
