// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAnk270LO4o-2q8h8-_yHSP1biu56MYQBw',
    appId: '1:710929278430:web:285967d308e64f296c694f',
    messagingSenderId: '710929278430',
    projectId: 'fitstack-4d510',
    authDomain: 'fitstack-4d510.firebaseapp.com',
    storageBucket: 'fitstack-4d510.appspot.com',
    measurementId: 'G-LHHNV7SHEG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCf6ZLfqJGw4g1JPBi7fCu4UQhJ-5qKYMQ',
    appId: '1:710929278430:android:a23cc9c448af39f56c694f',
    messagingSenderId: '710929278430',
    projectId: 'fitstack-4d510',
    storageBucket: 'fitstack-4d510.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA3nvlPlarQO7gE9Zbeukrrq1Sbjof2TPY',
    appId: '1:710929278430:ios:08dbea0f6d1874b46c694f',
    messagingSenderId: '710929278430',
    projectId: 'fitstack-4d510',
    storageBucket: 'fitstack-4d510.appspot.com',
    iosClientId: '710929278430-egilbhjp1pisvp4d3ppfqd4j57g7sco0.apps.googleusercontent.com',
    iosBundleId: 'com.example.fitstackapp',
  );
}