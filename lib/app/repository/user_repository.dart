import 'dart:developer';
import 'package:FitStack/app/helpers/endpoints.dart';
import 'package:FitStack/app/models/logs/active_energy_log_model.dart';
import 'package:FitStack/app/models/logs/bmi_log_model.dart';
import 'package:FitStack/app/models/logs/body_fat_log_model.dart';
import 'package:FitStack/app/models/logs/heart_rate_log_model.dart';
import 'package:FitStack/app/models/logs/height_log_model.dart';
import 'package:FitStack/app/models/logs/log_model.dart';
import 'package:FitStack/app/models/logs/sleep_asleep_log_model.dart';
import 'package:FitStack/app/models/logs/step_log_model.dart';
import 'package:FitStack/app/models/logs/weight_log_model.dart';
import 'package:FitStack/app/models/user/user_model.dart';
import 'package:FitStack/app/models/user/user_profile_model.dart';
import 'package:FitStack/app/models/user/user_statistic_model.dart';
import 'package:FitStack/app/repository/user_health_repository.dart';
import 'package:FitStack/app/services/analytics_service.dart';
import 'package:FitStack/main.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:health/health.dart';
import 'package:image_picker/image_picker.dart';

class UserRepository {
  final dio = Endpoints();

  Future<User?> getUser({required token}) async {
    try {
      Response response = await dio.post(
        '/user/signin',
        options: Options(
          headers: {"Authorization": "Bearer ${token}"},
        ),
      );

      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      } else {
        log("${response.statusCode}: ${response.statusMessage}");
        return null;
      }
    } on Error catch (e) {
      log('error: ${e}, stacktrace: ${e.stackTrace}');
      return null;
    }
  }

  Future<String?> updateProfileAvatar({required String token, required XFile file}) async {
    try {
      FormData data = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
        ),
      });

      Response response = await dio.post(
        '/user/update-avatar',
        options: Options(
          headers: {
            "Authorization": "Bearer ${token}",
          },
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        log(response.data);
        return response.data;
      } else {}
    } on Error catch (e) {
      log('error: ${e}, stacktrace: ${e.stackTrace}');
    }
    return null;
  }

  Future<UserProfile> getUserProfile({required String token}) async {
    try {
      Response response = await dio.get(
        '/user/profile',
        options: Options(
          headers: {
            "Authorization": "Bearer ${token}",
          },
        ),
      );

      if (response.statusCode == 200) {
        return UserProfile.fromJson(response.data);
      } else {}
    } on Error catch (e) {
      log('error: ${e}, stacktrace: ${e.stackTrace}');
    }
    return UserProfile.empty();
  }

  Future<UserStatistic> getStatistics({required String token}) async {
    try {
      Response response = await dio.get(
        '/user/statistics',
        options: Options(
          headers: {
            "Authorization": "Bearer ${token}",
          },
        ),
      );

      if (response.statusCode == 200) {
        return UserStatistic.fromJson(response.data);
      } else {
        log("${response.data}");
      }
    } catch (e) {
      log('error: ${e}, stacktrace: ${e}');
      locator<AnalyticsService>().logError(exception: e.toString(), reason: "error retrieving user statistics", stacktrace: StackTrace.current);
    }
    return UserStatistic.empty();
  }

  Future<UserStatistic> getStatisticsSnapshot({required String token}) async {
    try {
      Response response = await dio.get(
        '/user/statistics/snapshot',
        options: Options(
          headers: {
            "Authorization": "Bearer ${token}",
          },
        ),
      );

      if (response.statusCode == 200) {
        return UserStatistic.fromJson(response.data);
      }
    } catch (e) {
      log('error: ${e}, stacktrace: ${e}');
      locator<AnalyticsService>()
          .logError(exception: e.toString(), reason: "error retrieving user statistics snapshot", stacktrace: StackTrace.current);
    }

    return UserStatistic.empty();
  }

  Future<void> updateStatistics({required UserStatistic statistic, required String token}) async {
    try {
      log("${statistic.toJson()}");
      await dio.post(
        '/user/statistics',
        options: Options(
          headers: {
            "Authorization": "Bearer ${token}",
          },
        ),
        data: statistic.toJson(),
      );
    } catch (e) {
      log("$e");
    }
  }

  Future<UserStatistic> updateStatisticsSnapshot({required Duration fetchDate}) async {
    fetchDate = Duration(days: 100);
    try {
      String token = await fb.FirebaseAuth.instance.currentUser!.getIdToken();
      Map<HealthDataType, List<Log>> statistics = await UserHealthRepository().getUserStatisticsSnapshot(fetchDate: fetchDate);

      UserStatistic userStatistic = UserStatistic(
        stepsLogs: statistics[HealthDataType.STEPS]?.map((e) => e as StepsLog).toList(),
        weightLogs: statistics[HealthDataType.WEIGHT]?.map((e) => e as WeightLog).toList(),
        heartRateLogs: statistics[HealthDataType.HEART_RATE]?.map((e) => e as HeartRateLog).toList(),
        sleepAsleepLogs: statistics[HealthDataType.SLEEP_ASLEEP]?.map((e) => e as SleepAsleepLog).toList(),
        bodyFatPercentageLogs: statistics[HealthDataType.BODY_FAT_PERCENTAGE]?.map((e) => e as BodyFatPercentageLog).toList(),
        activeEnergyBurned: statistics[HealthDataType.ACTIVE_ENERGY_BURNED]?.map((e) => e as ActiveEnergyBurnedLog).toList(),
        bodyMassIndexLogs: statistics[HealthDataType.BODY_MASS_INDEX]?.map((e) => e as BodyMassIndexLog).toList(),
      );

      if (userStatistic != UserStatistic.empty()) {
        await dio.post(
          '/user/statistics',
          options: Options(
            headers: {
              "Authorization": "Bearer ${token}",
            },
          ),
          data: userStatistic.toJson(),
        );
      } else {
        log("empty statistic");
      }

      return userStatistic;
    } catch (e) {
      log("error updating statistics snapshot: $e");
      throw Exception("error updating statistics snapshot");
    }
  }

  Future<UserStatistic> getStatistic({required HealthDataType type}) {
    final token = fb.FirebaseAuth.instance.currentUser!.getIdToken();
    var response = dio.post(
      '/user/statistic',
      options: Options(
        headers: {
          "Authorization": "Bearer ${token}",
        },
      ),
      data: {
        "type": type.toString(),
      },
    );

    return response.then((value) => UserStatistic.fromJson(value.data));
  }
}
