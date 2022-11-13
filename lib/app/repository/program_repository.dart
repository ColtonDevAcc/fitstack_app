import 'dart:developer';

import 'package:FitStack/app/models/program/program_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';

class ProgramRepository {
  final Dio dio = Dio();
  final storage = new FlutterSecureStorage();
  static String mainUrl = kDebugMode ? "http://localhost:8080" : "https://dev.fitstack.io";

  ProgramRepository();

  Future<List<Program>> getPrograms({token: String}) async {
    try {
      Response response = await dio.get(
        mainUrl + '/program/get',
        options: Options(
          headers: {"Authorization": "Bearer ${token}"},
        ),
      );

      if (response.statusCode == 200) {
        List responseJson = response.data as List;
        List<Program> programs = responseJson.map((e) => Program.fromJson(e)).toList();
        return programs;
      }
    } on Error catch (e) {
      log('error: ${e}, stacktrace: ${e.stackTrace}');
      return [];
    }
    return [];
  }
}
