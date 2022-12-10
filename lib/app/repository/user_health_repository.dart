import 'dart:developer';

import 'package:FitStack/app/models/logs/active_energy_log_model.dart';
import 'package:FitStack/app/models/logs/basal_energy_log_model.dart';
import 'package:FitStack/app/models/logs/bmi_log_model.dart';
import 'package:FitStack/app/models/logs/body_fat_log_model.dart';
import 'package:FitStack/app/models/logs/step_log_model.dart';
import 'package:FitStack/app/models/logs/weight_log_model.dart';
import 'package:FitStack/app/models/user/user_statistic_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:health/health.dart';
import 'package:units_converter/models/extension_converter.dart';
import 'package:units_converter/properties/mass.dart';

class UserHealthRepository {
  final HealthFactory health = HealthFactory();
  Future<Map<HealthDataType, List<dynamic>>> ParseUserHealthData({required List<HealthDataPoint> healthData}) async {
    Map<HealthDataType, List<dynamic>> healthDataMap = {};

    healthData.forEach(
      (element) {
        var value = double.parse((element.value).toString());
        log("parsing statistics data for api");

        switch (element.type) {
          case HealthDataType.STEPS:
            healthDataMap[HealthDataType.STEPS] != null
                ? healthDataMap[HealthDataType.STEPS]!.add(
                    StepLog(
                      step_count: value.toInt(),
                      created_at: element.dateFrom.toUtc(),
                    ),
                  )
                : healthDataMap[HealthDataType.STEPS] = [
                    StepLog(
                      step_count: value.toInt(),
                      created_at: element.dateFrom.toUtc(),
                    ),
                  ];
            break;

          case HealthDataType.WEIGHT:
            healthDataMap[HealthDataType.WEIGHT] != null
                ? healthDataMap[HealthDataType.WEIGHT]!.add(
                    WeightLog(
                      weight: value,
                      created_at: element.dateFrom.toUtc(),
                    ),
                  )
                : healthDataMap[HealthDataType.WEIGHT] = [
                    WeightLog(
                      weight: value,
                      created_at: element.dateFrom.toUtc(),
                    ),
                  ];
            break;

          case HealthDataType.BODY_MASS_INDEX:
            healthDataMap[HealthDataType.BODY_MASS_INDEX] != null
                ? healthDataMap[HealthDataType.BODY_MASS_INDEX]!.add(
                    BMILog(
                      bmi: value,
                      created_at: element.dateFrom.toUtc(),
                    ),
                  )
                : healthDataMap[HealthDataType.BODY_MASS_INDEX] = [
                    BMILog(
                      bmi: value,
                      created_at: element.dateFrom.toUtc(),
                    ),
                  ];
            break;

          case HealthDataType.BODY_FAT_PERCENTAGE:
            healthDataMap[HealthDataType.BODY_FAT_PERCENTAGE] != null
                ? healthDataMap[HealthDataType.BODY_FAT_PERCENTAGE]!.add(
                    BodyFatLog(
                      body_fat: value,
                      created_at: element.dateFrom.toUtc(),
                    ),
                  )
                : healthDataMap[HealthDataType.BODY_FAT_PERCENTAGE] = [
                    BodyFatLog(
                      body_fat: value,
                      created_at: element.dateFrom.toUtc(),
                    ),
                  ];
            break;

          case HealthDataType.DISTANCE_WALKING_RUNNING:
            log("distance walking running is not supported value is ${element.value}");
            break;
          case HealthDataType.ACTIVE_ENERGY_BURNED:
            healthDataMap[HealthDataType.ACTIVE_ENERGY_BURNED] != null
                ? healthDataMap[HealthDataType.ACTIVE_ENERGY_BURNED]!.add(
                    ActiveEnergyLog(
                      active_energy: value,
                      created_at: element.dateFrom.toUtc(),
                    ),
                  )
                : healthDataMap[HealthDataType.ACTIVE_ENERGY_BURNED] = [
                    ActiveEnergyLog(
                      active_energy: value,
                      created_at: element.dateFrom.toUtc(),
                    ),
                  ];
            break;
          case HealthDataType.BASAL_ENERGY_BURNED:
            healthDataMap[HealthDataType.BASAL_ENERGY_BURNED] != null
                ? healthDataMap[HealthDataType.BASAL_ENERGY_BURNED]!.add(
                    BasalEnergyLog(
                      basal_energy: value,
                      created_at: element.dateFrom.toUtc(),
                    ),
                  )
                : healthDataMap[HealthDataType.BASAL_ENERGY_BURNED] = [
                    BasalEnergyLog(
                      basal_energy: value,
                      created_at: element.dateFrom.toUtc(),
                    ),
                  ];
            break;
          default:
            log("Error in checkUserStatistic: message: ${element.type} is not supported");
            break;
        }
      },
    );

    return healthDataMap;
  }

  Future<UserStatistic> getUserStatisticsSnapshot({required Duration fetchDate}) async {
    log("getting user statistics snapshot");
    List<HealthDataPoint> healthData = [];

    try {
      healthData = await health.getHealthDataFromTypes(
        DateTime.now().subtract(fetchDate),
        DateTime.now(),
        snapshotHealthDataTypes,
      );
    } catch (e) {
      log("Error in getUserStatisticsSnapshot: message: $e");
    }

    Map<HealthDataType, List<dynamic>> healthDataMap = await ParseUserHealthData(healthData: healthData);

    if (healthDataMap.isEmpty) {
      log("Error in getUserStatisticsSnapshot: message: healthDataMap is empty");
      return UserStatistic.empty();
    }

    return UserStatistic(
      step_log: (healthDataMap[HealthDataType.STEPS] != null ? healthDataMap[HealthDataType.STEPS] : null) as List<StepLog>?,
      weight_log: (healthDataMap[HealthDataType.WEIGHT] != null ? healthDataMap[HealthDataType.WEIGHT]! : null) as List<WeightLog>?,
      bmi_log: (healthDataMap[HealthDataType.BODY_MASS_INDEX] != null ? healthDataMap[HealthDataType.BODY_MASS_INDEX]! : null) as List<BMILog>?,
      body_fat_log: (healthDataMap[HealthDataType.BODY_FAT_PERCENTAGE] != null ? healthDataMap[HealthDataType.BODY_FAT_PERCENTAGE]! : null)
          as List<BodyFatLog>?,
      active_energy: (healthDataMap[HealthDataType.ACTIVE_ENERGY_BURNED] != null ? healthDataMap[HealthDataType.ACTIVE_ENERGY_BURNED]! : null)
          as List<ActiveEnergyLog>?,
    );
  }

  List<FlSpot> convertListToFlSpots({required List<dynamic> data, required HealthDataType dataType}) {
    // add an extra spot to the end of the list graph look better
    final List<FlSpot> spotsForMonth = [];
    int daysInMonth = DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day;

    int i = 0;
    switch (dataType) {
      case HealthDataType.WEIGHT:
        var weight = data as List<WeightLog>;
        var previousWeight = weight.first.weight.convertFromTo(MASS.kilograms, MASS.pounds)!;
        for (var day = 1; day <= daysInMonth; day++) {
          if (i < weight.length && weight[i].created_at?.day == day) {
            var pounds = weight[i].weight.convertFromTo(MASS.kilograms, MASS.pounds);
            spotsForMonth.add(
              FlSpot(
                day.toDouble(),
                pounds ?? 0,
              ),
            );
            previousWeight = weight[i].weight.convertFromTo(MASS.kilograms, MASS.pounds)!;
            i++;
          } else {
            spotsForMonth.add(FlSpot(day.toDouble(), previousWeight));
          }
        }
        break;
      case HealthDataType.BODY_MASS_INDEX:
        var bmi = data as List<BMILog>;
        var previousBMI = bmi.first.bmi;
        for (var day = 1; day <= daysInMonth; day++) {
          if (i < bmi.length && bmi[i].created_at?.day == day) {
            spotsForMonth.add(
              FlSpot(
                day.toDouble(),
                bmi[i].bmi,
              ),
            );
            previousBMI = bmi[i].bmi;
            i++;
          } else {
            spotsForMonth.add(FlSpot(day.toDouble(), previousBMI));
          }
        }
        break;
      case HealthDataType.STEPS:
        var steps = data as List<StepLog>;
        var previousSteps = steps.first.step_count;
        for (var day = 1; day <= daysInMonth; day++) {
          if (i < steps.length && steps[i].created_at?.day == day) {
            spotsForMonth.add(
              FlSpot(
                day.toDouble(),
                steps[i].step_count.toDouble(),
              ),
            );
            previousSteps = steps[i].step_count;
            i++;
          } else {
            spotsForMonth.add(FlSpot(day.toDouble(), previousSteps.toDouble()));
          }
        }
        break;

      default:
    }
    return spotsForMonth;
  }
}

const List<HealthDataType> snapshotHealthDataTypes = [
  HealthDataType.STEPS,
  HealthDataType.WEIGHT,
  HealthDataType.BODY_MASS_INDEX,
  HealthDataType.BODY_FAT_PERCENTAGE,
  HealthDataType.DISTANCE_WALKING_RUNNING,
  HealthDataType.ACTIVE_ENERGY_BURNED,
];
