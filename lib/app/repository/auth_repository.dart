import 'dart:async';
import 'dart:developer';

import 'package:FitStack/app/cache/auth_cache.dart';
import 'package:FitStack/app/helpers/endpoints.dart';
import 'package:FitStack/app/models/user/user_model.dart';
import 'package:FitStack/app/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';

class AuthenticationRepository {
  final controller = StreamController<AuthStream>.broadcast();
  final dio = Endpoints();
  final storage = new FlutterSecureStorage();

  AuthenticationRepository({fb.FirebaseAuth? firebaseAuth, AuthCache? authCache});

  //! token section start
  Stream<AuthStream> get status async* {
    yield AuthStream(user: User.empty(), status: AuthenticationStatus.unauthenticated);
    yield* controller.stream;
  }

  Future<void> persistLogin() async {
    controller.add(AuthStream(user: User.empty(), status: AuthenticationStatus.authenticating));

    var fbUser = fb.FirebaseAuth.instance.currentUser;
    if (fbUser == null) {
      try {
        String? refreshToken = await getRefreshToken();
        String? token = await getTokenFromRefresh(refresh_token: refreshToken);

        if (token != null && token != "") {
          User? user = await UserRepository().getUser(token: token);
          if (user != null && user != User.empty()) {
            controller.add(AuthStream(user: user, status: AuthenticationStatus.authenticated));
          }
        }
      } on Error catch (e) {
        log('error: ${e}, stacktrace: ${e.stackTrace}');
        controller.add(AuthStream(user: User.empty(), status: AuthenticationStatus.error, message: "Error logging in with token $e"));
      }
    } else {
      try {
        var token = await fb.FirebaseAuth.instance.currentUser?.getIdToken();
        User? user = await UserRepository().getUser(token: token);
        controller.add(AuthStream(user: user!, status: AuthenticationStatus.authenticated));
      } on Error catch (e) {
        log('error: ${e}, stacktrace: ${e.stackTrace}');
        controller.add(AuthStream(user: User.empty(), status: AuthenticationStatus.error, message: "Error logging in with token $e"));
      }
    }
  }

  Future<void> persistRefreshToken({token: String}) async {
    log('persisting refresh token');

    await storage.write(key: 'refreshToken', value: token);
  }

  Future<String?> getRefreshToken() async {
    return await storage.read(key: "refreshToken");
  }

  Future<bool> hasToken() async {
    var value = await storage.read(key: 'refreshToken');

    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'refreshToken');
    storage.deleteAll();
  }

  Future<String?> getTokenFromRefresh({refresh_token: String}) async {
    try {
      Response response = await dio.post(
        "/user/refresh-token",
        data: {"refresh_token": refresh_token},
      );
      return response.data;
    } on DioError catch (e) {
      kDebugMode ? log("error logging in user. message: ${e.message} response: ${e.response}") : null;
      controller.add(AuthStream(user: User.empty(), status: AuthenticationStatus.error, message: "Error logging in with token $e"));
      return null;
    } catch (e) {
      kDebugMode ? log("error logging in user $e") : null;
      controller.add(AuthStream(user: User.empty(), status: AuthenticationStatus.error, message: "error getting token $e"));
      return null;
    }
  }

  //! token section end

  Future<User> logInWithEmailAndPassword({email: String, password: String}) async {
    controller.add(AuthStream(user: User.empty(), status: AuthenticationStatus.authenticating));
    try {
      String userToken = await fb.FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) async {
        return await value.user!.getIdToken();
      });

      Response response = await dio.post(
        "/user/signin",
        options: Options(
          headers: {"Authorization": "Bearer ${userToken}"},
        ),
      );

      User user = User.fromJson(response.data);
      await persistRefreshToken(token: userToken);
      controller.add(AuthStream(user: user, status: AuthenticationStatus.authenticated));
      return user;
    } on Error catch (e) {
      log('error: ${e}, stacktrace: ${e.stackTrace}');
      controller.add(AuthStream(user: User.empty(), status: AuthenticationStatus.error, message: "Error logging in user $e"));
      return User.empty();
    }
  }

  Future<User> userSignUp({email: String, password: String, user: User}) async {
    controller.add(AuthStream(user: User.empty(), status: AuthenticationStatus.authenticating));
    try {
      var response = await Dio().post(
        "/user/signup",
        data: user.toJson(),
      );

      var newUser = User.fromJson(response.data);
      controller.add(AuthStream(user: newUser, status: AuthenticationStatus.authenticated));
      persistRefreshToken(token: newUser.refresh_token);
      return await newUser;
    } on DioError catch (e) {
      log("error while trying to signup user: ${e.message} - ${e.response}");
      return User.empty();
    } catch (e) {
      log("error while trying to signup user: $e");
      controller.add(AuthStream(user: User.empty(), status: AuthenticationStatus.error, message: "error while trying to signup user: $e"));
      return User.empty();
    }
  }

  void logOut() async {
    await deleteToken();
    fb.FirebaseAuth.instance.signOut();
    controller.add(AuthStream(user: User.empty(), status: AuthenticationStatus.unauthenticated));
  }

  void dispose() => controller.close();
}

class AuthStream {
  User user;
  AuthenticationStatus status;
  String? message;
  AuthStream({required this.user, required this.status, this.message});
}

enum AuthenticationStatus { unknown, authenticated, unauthenticated, error, authenticating }
