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
import 'package:health/health.dart';

class UserHealthRepository {
  Future<Map<HealthDataType, List<dynamic>>> ParseUserHealthData({required List<HealthDataPoint> healthData}) async {
    Map<HealthDataType, List<dynamic>> healthDataMap = {};

    healthData.forEach(
      (element) {
        var value = double.parse((element.value).toString());
        log("parsing statistics data for api");
        switch (element.type) {
          case HealthDataType.WEIGHT:
            healthDataMap[HealthDataType.WEIGHT]!.add(
              WeightLog(
                weight: value,
                created_at: element.dateFrom.toUtc(),
              ),
            );
            break;
          case HealthDataType.BODY_MASS_INDEX:
            healthDataMap[HealthDataType.WEIGHT]!.add(
              BMILog(
                bmi: value,
                created_at: element.dateFrom.toUtc(),
              ),
            );
            break;
          case HealthDataType.BODY_FAT_PERCENTAGE:
            healthDataMap[HealthDataType.WEIGHT]!.add(
              BodyFatLog(
                body_fat: value,
                created_at: element.dateFrom.toUtc(),
              ),
            );
            break;
          case HealthDataType.STEPS:
            healthDataMap[HealthDataType.WEIGHT]!.add(
              StepLog(
                step_count: value.toInt(),
                created_at: element.dateFrom.toUtc(),
              ),
            );
            break;
          case HealthDataType.DISTANCE_DELTA:
            healthDataMap[HealthDataType.WEIGHT]!.add(
              DistanceLog(
                distance: value,
                created_at: element.dateFrom.toUtc(),
              ),
            );
            break;
          case HealthDataType.MOVE_MINUTES:
            healthDataMap[HealthDataType.WEIGHT]!.add(
              ActiveMinutesLog(
                active_minutes: value,
                created_at: element.dateFrom.toUtc(),
              ),
            );
            break;
          case HealthDataType.HEART_RATE:
            healthDataMap[HealthDataType.WEIGHT]!.add(
              HeartRateLog(
                heart_rate: value,
                created_at: element.dateFrom.toUtc(),
              ),
            );
            break;
          case HealthDataType.SLEEP_IN_BED:
            {
              healthDataMap[HealthDataType.WEIGHT]!.add(
                SleepLog(
                  sleep: value,
                  created_at: element.dateFrom.toUtc(),
                ),
              );
              break;
            }
          case HealthDataType.BLOOD_PRESSURE_DIASTOLIC:
            healthDataMap[HealthDataType.WEIGHT]!.add(
              BloodPressureLog(
                diastolic: value,
                created_at: element.dateFrom.toUtc(),
              ),
            );
            break;
          case HealthDataType.BLOOD_PRESSURE_SYSTOLIC:
            healthDataMap[HealthDataType.WEIGHT]!.add(
              BloodPressureLog(
                systolic: value,
                created_at: element.dateFrom.toUtc(),
              ),
            );
            break;
          case HealthDataType.BLOOD_OXYGEN:
            healthDataMap[HealthDataType.WEIGHT]!.add(
              OxygenSaturationLog(
                oxygen_saturation: value,
                created_at: element.dateFrom.toUtc(),
              ),
            );
            break;
          case HealthDataType.BODY_TEMPERATURE:
            healthDataMap[HealthDataType.WEIGHT]!.add(
              BodyTemperatureLog(
                body_temperature: value,
                created_at: element.dateFrom.toUtc(),
              ),
            );
            break;
          case HealthDataType.ACTIVE_ENERGY_BURNED:
            healthDataMap[HealthDataType.WEIGHT]!.add(
              ActiveEnergyLog(
                active_energy: value,
                created_at: element.dateFrom.toUtc(),
              ),
            );
            break;
          case HealthDataType.BASAL_ENERGY_BURNED:
            healthDataMap[HealthDataType.WEIGHT]!.add(
              BasalEnergyLog(
                basal_energy: value,
                created_at: element.dateFrom.toUtc(),
              ),
            );
            break;
          default:
            log("Error in checkUserStatistic: message: ${element.type} is not supported");
            break;
        }
      },
    );

    return healthDataMap;
  }
}
