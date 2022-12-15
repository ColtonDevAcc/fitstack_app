import 'package:FitStack/app/helpers/endpoints.dart';
import 'package:FitStack/app/models/program/program_model.dart';
import 'package:FitStack/app/services/analytics_service.dart';
import 'package:FitStack/main.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';

class ProgramRepository {
  final dio = Endpoints();
  final storage = const FlutterSecureStorage();

  ProgramRepository();

  Future<List<Program>> getPrograms({required String token}) async {
    try {
      final Response response = await dio.get(
        '/program/get',
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      if (response.statusCode == 200) {
        final List responseJson = response.data as List;
        final List<Program> programs = responseJson.map((e) => Program.fromJson(e)).toList();
        return programs;
      }
    } catch (e) {
      locator<AnalyticsService>().logError(exception: e.toString(), reason: 'error getting programs');
      return [];
    }
    return [];
  }
}
