import 'dart:async';
import 'dart:developer';

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
  final storage = const FlutterSecureStorage();

  AuthenticationRepository();

  //! token section start
  Stream<AuthStream> get status async* {
    yield AuthStream(user: User.empty(), status: AuthenticationStatus.unauthenticated);
    yield* controller.stream;
  }

  Future<void> persistLogin() async {
    controller.add(AuthStream(user: User.empty(), status: AuthenticationStatus.authenticating));

    final fbUser = fb.FirebaseAuth.instance.currentUser;
    if (fbUser == null) {
      try {
        final String? refreshToken = await getRefreshToken();
        final String? token = await getTokenFromRefresh(refreshToken: refreshToken!);

        if (token != null && token != "") {
          final User? user = await UserRepository().getUser(token: token);
          if (user != null && user != User.empty()) {
            controller.add(AuthStream(user: user, status: AuthenticationStatus.authenticated));
          }
        }
      } catch (e) {
        log('error: $e, stacktrace: ${StackTrace.current}');
      }
    } else {
      try {
        final String token = await fbUser.getIdToken();
        final User? user = await UserRepository().getUser(token: token);
        if (user != null && user != User.empty()) {
          controller.add(AuthStream(user: user, status: AuthenticationStatus.authenticated));
        } else {
          controller.add(AuthStream(user: User.empty(), status: AuthenticationStatus.unauthenticated));
        }
      } catch (e) {
        log('error: $e, stacktrace: ${StackTrace.current}');
        controller.add(AuthStream(user: User.empty(), status: AuthenticationStatus.error, message: "Error logging in with token $e"));
      }
    }
  }

  Future<void> persistRefreshToken({required String token}) async {
    log('persisting refresh token');

    await storage.write(key: 'refreshToken', value: token);
  }

  Future<String?> getRefreshToken() async {
    return storage.read(key: "refreshToken");
  }

  Future<bool> hasToken() async {
    final value = await storage.read(key: 'refreshToken');

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

  Future<String?> getTokenFromRefresh({required String refreshToken}) async {
    try {
      final Response response = await dio.post(
        "/user/refresh-token",
        data: {"refresh_token": refreshToken},
      );
      return response.data;
    } on DioError catch (e) {
      if (kDebugMode) log("error logging in user. message: ${e.message} response: ${e.response}");
      controller.add(AuthStream(user: User.empty(), status: AuthenticationStatus.error, message: "Error logging in with token $e"));
      return null;
    } catch (e) {
      if (kDebugMode) log("error logging in user $e");
      controller.add(AuthStream(user: User.empty(), status: AuthenticationStatus.error, message: "error getting token $e"));
      return null;
    }
  }

  //! token section end

  Future<User> logInWithEmailAndPassword({required String email, required String password}) async {
    controller.add(AuthStream(user: User.empty(), status: AuthenticationStatus.authenticating));
    try {
      final String userToken = await fb.FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) async {
        return value.user!.getIdToken();
      });

      final Response response = await dio.post(
        "/user/signin",
        options: Options(
          headers: {"Authorization": "Bearer $userToken"},
        ),
      );

      final User user = User.fromJson(response.data);
      await persistRefreshToken(token: userToken);
      controller.add(AuthStream(user: user, status: AuthenticationStatus.authenticated));
      return user;
    } catch (e) {
      log('error: $e, stacktrace: ${StackTrace.current}');
      controller.add(AuthStream(user: User.empty(), status: AuthenticationStatus.error, message: "Error logging in user $e"));
      return User.empty();
    }
  }

  Future<User> userSignUp({required String email, required String password, required User user}) async {
    controller.add(AuthStream(user: User.empty(), status: AuthenticationStatus.authenticating));
    try {
      final response = await Dio().post(
        "/user/signup",
        data: user.toJson(),
      );

      final newUser = User.fromJson(response.data);
      controller.add(AuthStream(user: newUser, status: AuthenticationStatus.authenticated));
      persistRefreshToken(token: newUser.refreshToken!);
      return newUser;
    } on DioError catch (e) {
      log("error while trying to signup user: ${e.message} - ${e.response}");
      return User.empty();
    } catch (e) {
      log("error while trying to signup user: $e");
      controller.add(AuthStream(user: User.empty(), status: AuthenticationStatus.error, message: "error while trying to signup user: $e"));
      return User.empty();
    }
  }

  Future<void> logOut() async {
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
