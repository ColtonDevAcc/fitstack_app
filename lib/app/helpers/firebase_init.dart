import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FitStackFirebase {
  static Future<void> configureFirebaseAuth() async {
    String configHost = const String.fromEnvironment("FIREBASE_EMU_URL");
    int configPort = const int.fromEnvironment("AUTH_EMU_PORT");
    // Android emulator must be pointed to 10.0.2.2
    var defaultHost = Platform.isAndroid ? '10.0.2.2' : 'localhost';
    var host = configHost.isNotEmpty ? configHost : defaultHost;
    var port = configPort != 0 ? configPort : 9099;
    await FirebaseAuth.instance.useAuthEmulator(host, port);
    debugPrint('Using Firebase Auth emulator on: $host:$port');
  }

  static Future<void> configureFirebaseStorage() async {
    String configHost = const String.fromEnvironment("FIREBASE_EMU_URL");
    int configPort = const int.fromEnvironment("STORAGE_EMU_PORT");
    // Android emulator must be pointed to 10.0.2.2
    var defaultHost = Platform.isAndroid ? '10.0.2.2' : 'localhost';
    var host = configHost.isNotEmpty ? configHost : defaultHost;
    var port = configPort != 0 ? configPort : 9199;
    await FirebaseStorage.instance.useStorageEmulator(host, port);
    debugPrint('Using Firebase Storage emulator on: $host:$port');
  }

  static void configureFirebaseFirestore() {
    String configHost = const String.fromEnvironment("FIREBASE_EMU_URL");
    int configPort = const int.fromEnvironment("DB_EMU_PORT");
    // Android emulator must be pointed to 10.0.2.2
    var defaultHost = Platform.isAndroid ? '10.0.2.2' : 'localhost';
    var host = configHost.isNotEmpty ? configHost : defaultHost;
    var port = configPort != 0 ? configPort : 8080;

    debugPrint('Using Firebase Firestore emulator on: $host:$port');
  }
}
