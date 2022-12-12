import 'dart:developer';
import 'package:FitStack/app/models/logs/active_energy_log_model.dart';
import 'package:FitStack/app/models/logs/bmi_log_model.dart';
import 'package:FitStack/app/models/logs/body_fat_log_model.dart';
import 'package:FitStack/app/models/logs/log_model.dart';
import 'package:FitStack/app/models/logs/sleep_asleep_log_model.dart';
import 'package:FitStack/app/models/logs/step_log_model.dart';
import 'package:FitStack/app/models/logs/weight_log_model.dart';
import 'package:flutter/foundation.dart';
import 'package:health/health.dart';

class UserHealthRepository {
  final HealthFactory health = HealthFactory();

  Future<Map<HealthDataType, List<Log>>> isolateParseUserHealthData({required List<HealthDataPoint> data}) {
    return compute(_parseUserHealthData, data);
  }

  Map<HealthDataType, List<Log>> _parseUserHealthData(List<HealthDataPoint> data) {
    Map<HealthDataType, List<Log>> healthDataMap = {
      HealthDataType.STEPS: <StepsLog>[],
      HealthDataType.WEIGHT: <WeightLog>[],
      HealthDataType.BODY_MASS_INDEX: <BodyMassIndexLog>[],
      HealthDataType.BODY_FAT_PERCENTAGE: <BodyFatPercentageLog>[],
      HealthDataType.ACTIVE_ENERGY_BURNED: <ActiveEnergyBurnedLog>[],
      HealthDataType.SLEEP_ASLEEP: <SleepAsleepLog>[],
    };

    data.forEach(
      (element) {
        switch (element.type) {
          case HealthDataType.STEPS:
            healthDataMap[HealthDataType.STEPS]?.add(StepsLog.fromHealthData(element));
            break;
          case HealthDataType.WEIGHT:
            healthDataMap[HealthDataType.WEIGHT]?.add(WeightLog.fromHealthData(element));
            break;
          case HealthDataType.BODY_MASS_INDEX:
            healthDataMap[HealthDataType.BODY_MASS_INDEX]?.add(BodyMassIndexLog.fromHealthData(element));
            break;
          case HealthDataType.BODY_FAT_PERCENTAGE:
            healthDataMap[HealthDataType.BODY_FAT_PERCENTAGE]?.add(BodyFatPercentageLog.fromHealthData(element));
            break;
          case HealthDataType.ACTIVE_ENERGY_BURNED:
            healthDataMap[HealthDataType.ACTIVE_ENERGY_BURNED]?.add(ActiveEnergyBurnedLog.fromHealthData(element));
            break;
          case HealthDataType.SLEEP_ASLEEP:
            healthDataMap[HealthDataType.SLEEP_ASLEEP]?.add(SleepAsleepLog.fromHealthData(element));
            break;
          default:
            log("Error in ParseUserHealthData: message: ${element.type} is not supported");
        }
      },
    );

    return healthDataMap;
  }

  Future<Map<HealthDataType, List<Log>>> getUserStatisticsSnapshot({required Duration fetchDate}) async {
    List<HealthDataPoint> healthData = [];
    List<HealthDataAccess> permissions = [];

    snapshotHealthDataTypes.forEach((element) => permissions.add(HealthDataAccess.READ_WRITE));
    bool? hasPermissions = await HealthFactory.hasPermissions(snapshotHealthDataTypes);

    if (hasPermissions == null || !hasPermissions) {
      bool requested = await health.requestAuthorization(snapshotHealthDataTypes, permissions: permissions);
      if (!requested) {
        log("Error in getUserStatisticsSnapshot: message: requested is false");
        return {};
      }
    }

    try {
      var data = await health.getHealthDataFromTypes(
        DateTime.now().subtract(fetchDate),
        DateTime.now(),
        snapshotHealthDataTypes,
      );
      healthData = HealthFactory.removeDuplicates(data);
    } catch (e) {
      log("Error in getUserStatisticsSnapshot: message: $e");
    }

    Map<HealthDataType, List<Log>> healthDataMap = await isolateParseUserHealthData(data: healthData);

    if (healthDataMap.isEmpty) {
      log("Error in getUserStatisticsSnapshot: message: healthDataMap is empty");
      return {};
    }

    return healthDataMap;
  }
}

const List<HealthDataType> snapshotHealthDataTypes = [
  HealthDataType.STEPS,
  HealthDataType.WEIGHT,
  HealthDataType.BODY_MASS_INDEX,
  HealthDataType.BODY_FAT_PERCENTAGE,
  HealthDataType.ACTIVE_ENERGY_BURNED,
];
