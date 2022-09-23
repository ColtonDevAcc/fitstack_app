import 'dart:async';
import 'dart:developer';

import 'package:FitStack/app/cache/auth_cache.dart';
import 'package:FitStack/app/injection/dependency_injection.dart';
import 'package:FitStack/app/models/user_model.dart';
import 'package:FitStack/app/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:dio/dio.dart';

class AuthenticationRepository {
  final controller = StreamController<AuthStream>.broadcast();
  final Dio dio = Dio();
  final storage = new FlutterSecureStorage();
  static String mainUrl = kDebugMode ? "https://dev.fitstack.io" : "https://api.fitstack.io";
  static String loginUrl = "/user/login";

  AuthenticationRepository({
    fb.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
    AuthCache? authCache,
  });

  Future<void> persistToken({token: String}) async {
    await storage.write(key: 'token', value: token);
  }

  //! token section start
  Stream<AuthStream> get status async* {
    yield AuthStream(user: User.empty(), status: AuthenticationStatus.unauthenticated);
    yield* controller.stream;
  }

  Future<void> persistLogin() async {
    try {
      String? token = await getToken();
      if (token != null && token != "") {
        User? user = await getIt<UserRepository>().getUser(token: token);
        if (user != null && user != User.empty()) {
          controller.add(AuthStream(user: user, status: AuthenticationStatus.authenticated));
        }
      }
    } catch (e) {
      log('error: ${e}');
      controller.add(AuthStream(user: User.empty(), status: AuthenticationStatus.unauthenticated));
    }
  }

  Future<String?> getToken() async {
    return await storage.read(key: "token");
  }

  Future<bool> hasToken() async {
    var value = await storage.read(key: 'token');

    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'token');
    storage.deleteAll();
  }
  //! token section end

  Future<void> logInWithEmailAndPassword({email: String, password: String}) async {
    try {
      fb.User fbUser = await fb.FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) => value.user!);
      String userToken = await fbUser.getIdToken();

      Response response = await dio.post(
        loginUrl,
        data: {"token": userToken},
      );

      controller.add(AuthStream(user: response.data["user"], status: AuthenticationStatus.authenticated));
      persistToken(token: fbUser.refreshToken);
    } catch (e) {
      controller.add(AuthStream(user: User.empty(), status: AuthenticationStatus.unauthenticated));
    }
  }

  void logOut() async {
    await deleteToken();
    controller.add(AuthStream(user: User.empty(), status: AuthenticationStatus.unauthenticated));
  }

  void dispose() => controller.close();
}

class AuthStream {
  User user;
  AuthenticationStatus status;
  AuthStream({required this.user, required this.status});
}

enum AuthenticationStatus { unknown, authenticated, unauthenticated }
