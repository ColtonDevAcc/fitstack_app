import 'dart:developer';

import 'package:FitStack/app/models/logs/active_energy_log_model.dart';
import 'package:FitStack/app/models/logs/bmi_log_model.dart';
import 'package:FitStack/app/models/logs/body_fat_log_model.dart';
import 'package:FitStack/app/models/logs/log_model.dart';
import 'package:FitStack/app/models/logs/sleep_asleep_log_model.dart';
import 'package:FitStack/app/models/logs/step_log_model.dart';
import 'package:FitStack/app/models/logs/weight_log_model.dart';
import 'package:health/health.dart';

class UserHealthRepository {
  final HealthFactory health = HealthFactory();
  Future<Map<HealthDataType, List<Log>>> ParseUserHealthData({required List<HealthDataPoint> healthData}) async {
    Map<HealthDataType, List<Log>> healthDataMap = {};

    healthData.forEach(
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

      log("data: $data");

      HealthFactory.removeDuplicates(healthData);
    } catch (e) {
      log("Error in getUserStatisticsSnapshot: message: $e");
    }

    Map<HealthDataType, List<Log>> healthDataMap = await ParseUserHealthData(healthData: healthData);

    if (healthDataMap.isEmpty) {
      log("Error in getUserStatisticsSnapshot: message: healthDataMap is empty");
      return {};
    }

    log("healthDataMap: $healthDataMap");
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
