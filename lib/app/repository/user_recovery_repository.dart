import 'dart:developer';

import 'package:FitStack/app/helpers/endpoints.dart';
import 'package:FitStack/app/models/muscle/recovery_model.dart';
import 'package:FitStack/app/services/analytics_service.dart';
import 'package:FitStack/main.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserRecoveryRepository {
  final dio = Endpoints();
  final storage = const FlutterSecureStorage();
  UserRecoveryRepository();

  Future<Recovery> getUserRecovery() async {
    try {
      final response = await dio.get("/recovery/stats");
      final Recovery recovery = Recovery.fromJson(response.data);
      return recovery;
    } catch (e) {
      log("error fetching user recovery ${e.toString()}");
      locator<AnalyticsService>().logError(exception: e.toString(), reason: "error fetching user recovery", stacktrace: StackTrace.current);
      return Recovery.empty();
    }
  }
}
