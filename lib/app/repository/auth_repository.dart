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
  static String mainUrl = kDebugMode ? "https://dev.fitstack.io" : "https://dev.fitstack.io";

  AuthenticationRepository({
    fb.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
    AuthCache? authCache,
  });

  //! token section start
  Stream<AuthStream> get status async* {
    yield AuthStream(user: User.empty(), status: AuthenticationStatus.unauthenticated);
    yield* controller.stream;
  }

  Future<void> persistLogin() async {
    var fbUser = fb.FirebaseAuth.instance.currentUser;
    if (fbUser == null) {
      try {
        String? refreshToken = await getRefreshToken();
        String? token = await getTokenFromRefresh(refresh_token: refreshToken);

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
    } else {
      try {
        var token = await fb.FirebaseAuth.instance.currentUser?.getIdToken();
        User? user = await getIt<UserRepository>().getUser(token: token);
        controller.add(AuthStream(user: user!, status: AuthenticationStatus.authenticated));
      } catch (e) {
        log('error: ${e}');
        controller.add(AuthStream(user: User.empty(), status: AuthenticationStatus.unauthenticated));
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

  Future<String?> getTokenFromRefresh({refresh_token: String}) async {
    try {
      Response response = await dio.post(
        mainUrl + "/user/refresh-token",
        data: {"refresh_token": refresh_token},
      );
      controller.add(AuthStream(user: User.fromJson(response.data["user"]), status: AuthenticationStatus.authenticated));
      return response.data;
    } on DioError catch (e) {
      log("error logging in user. message: ${e.message} response: ${e.response}");
      return null;
    } catch (e) {
      log("error logging in user $e");
      return null;
    }
  }

  //! token section end

  Future<User> logInWithEmailAndPassword({email: String, password: String}) async {
    try {
      log('signing user in');
      var userToken = await fb.FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) async {
        return await value.user!.getIdToken();
      });

      Response response = await dio.post(
        mainUrl + "/user/signin",
        data: {"token": userToken},
      );

      await persistRefreshToken(token: userToken);
      controller.add(AuthStream(user: User.fromJson(response.data["user"]), status: AuthenticationStatus.authenticated));
      return User.fromJson(response.data["user"]);
    } on DioError catch (e) {
      log("error logging in user. message: ${e.message} response: ${e.response}");
      controller.add(AuthStream(user: User.empty(), status: AuthenticationStatus.unauthenticated));
      return User.empty();
    } catch (e) {
      log("error logging in user $e");
      controller.add(AuthStream(user: User.empty(), status: AuthenticationStatus.unauthenticated));
      return User.empty();
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
