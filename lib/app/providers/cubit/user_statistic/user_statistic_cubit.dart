import 'dart:developer';

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
import 'package:FitStack/app/repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:health/health.dart';

part 'user_statistic_state.dart';

class UserStatisticCubit extends Cubit<UserStatisticState> {
  final UserRepository userRepository;
  UserStatisticCubit({required this.userRepository})
      : super(
          UserStatisticState(status: UserStatisticsStatus.initial, userStatistic: UserStatistic.empty()),
        );

  Future<void> getUserStatistic() async {
    emit(UserStatisticState(status: UserStatisticsStatus.loading, userStatistic: UserStatistic.empty()));
    try {
      final token = await FirebaseAuth.instance.currentUser!.getIdToken();

      final userStatistic = await userRepository.getStatistics(token: token);
      emit(
        UserStatisticState(
          status: UserStatisticsStatus.loaded,
          userStatistic: userStatistic,
        ),
      );

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
      if (today.difference(state.userStatistic.updated_at!.toUtc()).inHours > 2) {
        var lastFetch = state.userStatistic.updated_at;
        var healthData = await health.getHealthDataFromTypes(
          lastFetch ?? today.subtract(Duration(days: 365)),
          DateTime.now(),
          types,
        );

        // update the data
        var token = await FirebaseAuth.instance.currentUser!.getIdToken();
        List<WeightLog> userWeightLogs = [];
        List<BMILog> userBmiLogs = [];
        List<BodyFatLog> userBodyFatLogs = [];
        List<StepLog> step_log = [];
        List<DistanceLog> distance_log = [];
        List<ActiveMinutesLog> active_minutes_log = [];
        List<HeartRateLog> heart_rate_log = [];
        List<SleepLog> sleep_log = [];
        List<BloodPressureLog> blood_pressure_log = [];
        List<BodyTemperatureLog> body_temperature = [];
        List<OxygenSaturationLog> oxygen_saturation = [];
        //! List<RespiratoryLog> respiratory_rate = [];
        List<ActiveEnergyLog> active_energy = [];
        List<BasalEnergyLog> basal_energy = [];

        healthData.forEach((element) {
          var value = double.parse((element.value).toString());
          log("parsing statistics data for api");
          switch (element.type) {
            case HealthDataType.WEIGHT:
              userWeightLogs.add(WeightLog(
                weight: value,
                created_at: element.dateFrom.toUtc(),
              ));
              break;
            case HealthDataType.BODY_MASS_INDEX:
              userBmiLogs.add(BMILog(
                bmi: value,
                created_at: element.dateFrom.toUtc(),
              ));
              break;
            case HealthDataType.BODY_FAT_PERCENTAGE:
              userBodyFatLogs.add(BodyFatLog(
                body_fat: value,
                created_at: element.dateFrom.toUtc(),
              ));
              break;
            case HealthDataType.STEPS:
              step_log.add(StepLog(
                step_count: value.toInt(),
                created_at: element.dateFrom.toUtc(),
              ));
              break;
            case HealthDataType.DISTANCE_DELTA:
              distance_log.add(DistanceLog(
                distance: value,
                created_at: element.dateFrom.toUtc(),
              ));
              break;
            case HealthDataType.MOVE_MINUTES:
              active_minutes_log.add(ActiveMinutesLog(
                active_minutes: value,
                created_at: element.dateFrom.toUtc(),
              ));
              break;
            case HealthDataType.HEART_RATE:
              heart_rate_log.add(HeartRateLog(
                heart_rate: value,
                created_at: element.dateFrom.toUtc(),
              ));
              break;
            case HealthDataType.SLEEP_IN_BED:
              {
                sleep_log.add(SleepLog(
                  sleep: value,
                  created_at: element.dateFrom.toUtc(),
                ));
                break;
              }
            case HealthDataType.BLOOD_PRESSURE_DIASTOLIC:
              blood_pressure_log.add(BloodPressureLog(
                diastolic: value,
                created_at: element.dateFrom.toUtc(),
              ));
              break;
            case HealthDataType.BLOOD_PRESSURE_SYSTOLIC:
              blood_pressure_log.add(BloodPressureLog(
                systolic: value,
                created_at: element.dateFrom.toUtc(),
              ));
              break;
            case HealthDataType.BLOOD_OXYGEN:
              oxygen_saturation.add(OxygenSaturationLog(
                oxygen_saturation: value,
                created_at: element.dateFrom.toUtc(),
              ));
              break;
            case HealthDataType.BODY_TEMPERATURE:
              body_temperature.add(BodyTemperatureLog(
                body_temperature: value,
                created_at: element.dateFrom.toUtc(),
              ));
              break;
            case HealthDataType.ACTIVE_ENERGY_BURNED:
              active_energy.add(ActiveEnergyLog(
                active_energy: value,
                created_at: element.dateFrom.toUtc(),
              ));
              break;
            case HealthDataType.BASAL_ENERGY_BURNED:
              basal_energy.add(BasalEnergyLog(
                basal_energy: value,
                created_at: element.dateFrom.toUtc(),
              ));
              break;
            default:
              log("Error in checkUserStatistic: message: ${element.type} is not supported");
              break;
          }
        });

        if (healthData.isEmpty == false) {
          await userRepository.updateStatistics(
              statistic: UserStatistic(
                weight_log: userWeightLogs,
                bmi_log: userBmiLogs,
                body_fat_log: userBodyFatLogs,
                updated_at: DateTime.now().toUtc(),
              ),
              token: token);

          userWeightLogs.addAll(state.userStatistic.weight_log ?? []);
          userBmiLogs.addAll(state.userStatistic.bmi_log ?? []);
          userBodyFatLogs.addAll(state.userStatistic.body_fat_log ?? []);

          emit(
            state.copyWith(
              status: UserStatisticsStatus.loaded,
              userStatistic: state.userStatistic.copyWith(
                bmi_log: userBmiLogs,
                weight_log: userWeightLogs,
                body_fat_log: userBodyFatLogs,
                updated_at: DateTime.now().toUtc(),
              ),
            ),
          );
        } else
          log("No data to update");
      } else {
        log("No new statistics data fetched");
      }
    } catch (e) {
      log("message: ${e.toString()}");
    }
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
