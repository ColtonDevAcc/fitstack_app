import 'dart:developer';

import 'package:FitStack/app/helpers/fitstack_error_toast.dart';
import 'package:FitStack/app/models/logs/active_energy_log_model.dart';
import 'package:FitStack/app/models/logs/active_minutes_log_model.dart';
import 'package:FitStack/app/models/logs/basal_energy_log_model.dart';
import 'package:FitStack/app/models/logs/blood_pressure_log_model.dart';
import 'package:FitStack/app/models/logs/bmi_log_model.dart';
import 'package:FitStack/app/models/logs/body_fat_log_model.dart';
import 'package:FitStack/app/models/logs/body_temperature_log_model.dart';
import 'package:FitStack/app/models/logs/distance_log_model.dart';
import 'package:FitStack/app/models/logs/heart_rate_log_model.dart';
import 'package:FitStack/app/models/logs/oxygen_saturation_log_model.dart';
import 'package:FitStack/app/models/logs/sleep_log_model.dart';
import 'package:FitStack/app/models/logs/step_log_model.dart';
import 'package:FitStack/app/models/logs/weight_log_model.dart';
import 'package:FitStack/app/models/user/user_statistic_model.dart';
import 'package:FitStack/app/repository/user_health_repository.dart';
import 'package:FitStack/app/repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:health/health.dart';

part 'user_statistic_state.dart';

class UserStatisticCubit extends Cubit<UserStatisticState> {
  final UserRepository userRepository;
  final UserHealthRepository userHealthRepository;
  UserStatisticCubit({required this.userHealthRepository, required this.userRepository})
      : super(
          UserStatisticState(status: UserStatisticsStatus.initial, userStatistic: UserStatistic.empty()),
        );

  Future<void> getUserStatistic() async {
    emit(UserStatisticState(status: UserStatisticsStatus.loading, userStatistic: UserStatistic.empty()));
    try {
      final token = await FirebaseAuth.instance.currentUser!.getIdToken();

      final userStatistic = await userRepository.getStatistics(token: token);
      emit(UserStatisticState(status: UserStatisticsStatus.loaded, userStatistic: userStatistic));

      await checkUserStatistic();

      double weightDifference = getWeightDifference();
      double bmiDifference = getBmiDifference();
      double fatPercentageDifference = getFatPercentageDifference();
      emit(
        state.copyWith(
          weightDifference: weightDifference,
          bmiDifference: bmiDifference,
          fatPercentageDifference: fatPercentageDifference,
        ),
      );
    } catch (e) {
      log("Error in getUserStatistic: message: $e");
      emit(UserStatisticState(status: UserStatisticsStatus.error, userStatistic: UserStatistic.empty()));
    }
  }

  Future<void> checkUserStatistic() async {
    emit(state.copyWith(status: UserStatisticsStatus.loading));
    HealthFactory health = HealthFactory();
    var today = DateTime.now();
    var types = [
      HealthDataType.WEIGHT,
      HealthDataType.BODY_MASS_INDEX,
      HealthDataType.BODY_FAT_PERCENTAGE,
      HealthDataType.STEPS,
      HealthDataType.DISTANCE_WALKING_RUNNING,
      // HealthDataType.MOVE_MINUTES,
      HealthDataType.HEART_RATE,
      HealthDataType.SLEEP_IN_BED,
      HealthDataType.BLOOD_PRESSURE_DIASTOLIC,
      HealthDataType.BLOOD_PRESSURE_SYSTOLIC,
      HealthDataType.BLOOD_OXYGEN,
      HealthDataType.BODY_TEMPERATURE,
      //! RespiratoryRate.
      //! OxygenSaturation
      HealthDataType.ACTIVE_ENERGY_BURNED,
      HealthDataType.BASAL_ENERGY_BURNED,
    ];

    //check if last update is today
    try {
      if (today.difference(state.userStatistic.updated_at!.toUtc()).inDays > 1) {
        var lastFetch = state.userStatistic.updated_at;
        var healthData = await health.getHealthDataFromTypes(lastFetch ?? today.subtract(Duration(days: 365)), DateTime.now(), types);
        var healthDataMap = await userHealthRepository.ParseUserHealthData(healthData: healthData);
        String token = await FirebaseAuth.instance.currentUser!.getIdToken();

        if (healthData.isEmpty == false) {
          await userRepository
              .updateStatistics(
                statistic: UserStatistic(
                  weight_log: healthDataMap[HealthDataType.WEIGHT] as List<WeightLog>?,
                  bmi_log: healthDataMap[HealthDataType.BODY_MASS_INDEX] as List<BMILog>?,
                  body_fat_log: healthDataMap[HealthDataType.BODY_FAT_PERCENTAGE] as List<BodyFatLog>?,
                  updated_at: DateTime.now().toUtc(),
                ),
                token: token,
              )
              .then(
                (value) => emit(
                  state.copyWith(
                    status: UserStatisticsStatus.loaded,
                    userStatistic: state.userStatistic.copyWith(
                      bmi_log: healthDataMap[HealthDataType.BODY_MASS_INDEX] as List<BMILog>?,
                      weight_log: healthDataMap[HealthDataType.WEIGHT] as List<WeightLog>?,
                      body_fat_log: healthDataMap[HealthDataType.BODY_FAT_PERCENTAGE] as List<BodyFatLog>?,
                      updated_at: DateTime.now().toUtc(),
                    ),
                  ),
                ),
              );
        } else {
          kDebugMode ? log("no new data to update") : null;
        }
        FitStackToast.showSuccessToast(healthData.length > 0 ? "User Statistic Updated ${healthData.length} Logs" : "already up to date");
      }
    } catch (e) {
      FitStackToast.showErrorToast("error fetching user statistics $e");
      kDebugMode ? log("message: ${e.toString()}") : null;
    }

    emit(state.copyWith(status: UserStatisticsStatus.loaded));
  }

  double getWeightDifference() {
    if (state.userStatistic != UserStatistic.empty() && state.userStatistic.weight_log != null && !state.userStatistic.weight_log!.isEmpty) {
      kDebugMode ? log("getWeightDifference") : null;
      var weightMax = state.userStatistic.weight_log?.first.weight ?? 0;
      var weightMin = state.userStatistic.weight_log?.last.weight ?? 0;
      return (weightMax - weightMin).roundToDouble();
    } else {
      log("No weight logs");
      return 0;
    }
  }

  double getBmiDifference() {
    if (state.userStatistic != UserStatistic.empty() && state.userStatistic.bmi_log != [] && !state.userStatistic.bmi_log!.isEmpty) {
      kDebugMode ? log("getBmiDifference") : null;
      var bmiMax = state.userStatistic.bmi_log?.first.bmi ?? 0;
      var bmiMin = state.userStatistic.bmi_log?.last.bmi ?? 0;

      // return percentage difference
      return ((bmiMax - bmiMin) / bmiMin * 100).roundToDouble();
    } else {
      log("No bmi logs");
      return 0;
    }
  }

  double getFatPercentageDifference() {
    if (state.userStatistic != UserStatistic.empty() && state.userStatistic.body_fat_log != null && state.userStatistic.body_fat_log!.length > 2) {
      log("getFatPercentageDifference");
      kDebugMode ? log("getFatPercentageDifference") : null;
      double fatPercentageMax = state.userStatistic.body_fat_log?.first.body_fat ?? 0;
      double fatPercentageMin = state.userStatistic.body_fat_log?.last.body_fat ?? 0;
      // return percentage difference
      return ((fatPercentageMax - fatPercentageMin) / fatPercentageMin * 100).roundToDouble();
    } else {
      log("No body fat logs");
      return 0;
    }
  }
}
