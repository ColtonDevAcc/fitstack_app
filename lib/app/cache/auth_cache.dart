import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';

import '../models/user_model.dart';

class AuthCache {
  AuthCache();

  final GetStorage _cache = GetStorage('auth_storage');

  bool writeToCache({String? key, dynamic value}) {
    if (key == null || value == null) return false;
    try {
      this._cache.write(key, value);
      return true;
    } catch (e) {
      if (kDebugMode) print("error writing to auth_storage cache: ${e}");
      return false;
    }
  }

  dynamic readFromCache({String? key}) {
    if (key == null) return null;
    try {
      return this._cache.read(key);
    } catch (e) {
      if (kDebugMode) print("error reading from auth_storage cache: ${e}");
      return null;
    }
  }

  User readUserFromCache() {
    try {
      User? user = jsonDecode(this._cache.read('user'));
      return user == null ? User.empty : user;
    } catch (e) {
      if (kDebugMode) print("Error reading user from cache: ${e}");
      return User.empty;
    }
  }
}
