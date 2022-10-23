import 'dart:async';

import 'package:FitStack/app/repository/relationship_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';

class ProgramRepository {
  final Dio dio = Dio();
  final storage = new FlutterSecureStorage();
  static String mainUrl = kDebugMode ? "http://10.0.2.2:8000" : "https://dev.fitstack.io";
  final controller = StreamController<FriendStream>.broadcast();

  ProgramRepository();

  //! token section start
  Stream<FriendStream> get friendStatus async* {
    yield FriendStream(friendship: [], status: FriendshipFetchStatus.initial);
    yield* controller.stream;
  }

  void dispose() => controller.close();
}
