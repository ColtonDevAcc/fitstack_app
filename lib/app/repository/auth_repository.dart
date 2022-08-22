import 'dart:async';

import 'package:FitStack/app/cache/auth_cache.dart';
import 'package:FitStack/app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:dio/dio.dart';
import 'package:FitStack/app/models/user_model.dart' as fs;

enum AuthenticationStatus {
  authenticated,
  unauthenticated,
  unknown,
  authenticating,
}

class AuthenticationRepository {
  final fb.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final AuthCache _cache;
  final controller = StreamController<AuthenticationStatus>();
  final Dio dio = Dio();
  final storage = new FlutterSecureStorage();
  static const userCacheKey = 'us';
  static String mainUrl = kDebugMode ? "https://dev.fitstack.io" : "https://api.fitstack.io";
  static String loginUrl = "/user/login";

  AuthenticationRepository({
    fb.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
    AuthCache? authCache,
  })  : _firebaseAuth = firebaseAuth ?? fb.FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard(),
        _cache = authCache ?? AuthCache();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* controller.stream;
  }

  Future<fs.User> logInWithEmailAndPassword({email: String, password: String}) {
    return _firebaseAuth.signInWithEmailAndPassword(email: email, password: password).then(
          (value) => value.user != null ? fs.User.fromFirebase(value.user!) : fs.User.empty(),
        );
  }

  Stream<fs.User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? User.empty() : User.fromFirebase(firebaseUser);
      _cache.writeToCache(key: userCacheKey, value: user.toString());
      return user;
    });
  }

  User get currentUser {
    return _cache.readUserFromCache();
  }

  Future<void> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        // _googleSignIn.signOut(),
      ]);
      () => controller.add(AuthenticationStatus.unauthenticated);
    } catch (e) {
      () => controller.add(AuthenticationStatus.unknown);
      throw e;
    }
  }

  Future<String?> hasToken() async {
    var value = await storage.read(key: 'token');

    if (value != null) {
      return value;
    } else {
      return null;
    }
  }

  Future<void> persistToken({token: String}) async {
    var value = await storage.write(key: 'token', value: token);
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'token');
    storage.deleteAll();
  }

  Future<String> login({email: String, password: String}) async {
    Response response = await dio.post(
      loginUrl,
      data: {
        "email": email,
        "password": password,
      },
    );

    () => controller.add(AuthenticationStatus.authenticated);
    return response.data["token"];
  }

  void dispose() => controller.close();
}
