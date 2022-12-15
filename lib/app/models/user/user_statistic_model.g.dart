// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_statistic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserStatistic _$UserStatisticFromJson(Map json) => UserStatistic(
      stepsLogs: (json['steps_logs'] as List<dynamic>?)
          ?.map((e) => StepsLog.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      heartRateLogs: (json['heart_rate_logs'] as List<dynamic>?)
          ?.map(
              (e) => HeartRateLog.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      sleepAsleepLogs: (json['sleep_asleep_logs'] as List<dynamic>?)
          ?.map((e) =>
              SleepAsleepLog.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      activeEnergyBurned: (json['active_energy_burned_logs'] as List<dynamic>?)
          ?.map((e) => ActiveEnergyBurnedLog.fromJson(
              Map<String, dynamic>.from(e as Map)))
          .toList(),
      weightLogs: (json['weight_logs'] as List<dynamic>?)
          ?.map((e) => WeightLog.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      bodyMassIndexLogs: (json['body_mass_index_logs'] as List<dynamic>?)
          ?.map((e) =>
              BodyMassIndexLog.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      bodyFatPercentageLogs:
          (json['body_fat_percentage_logs'] as List<dynamic>?)
              ?.map((e) => BodyFatPercentageLog.fromJson(
                  Map<String, dynamic>.from(e as Map)))
              .toList(),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      id: json['id'] as String?,
    );

const _$UserStatisticFieldMap = <String, String>{
  'id': 'id',
  'weightLogs': 'weight_logs',
  'bodyMassIndexLogs': 'body_mass_index_logs',
  'bodyFatPercentageLogs': 'body_fat_percentage_logs',
  'stepsLogs': 'steps_logs',
  'heartRateLogs': 'heart_rate_logs',
  'sleepAsleepLogs': 'sleep_asleep_logs',
  'activeEnergyBurned': 'active_energy_burned_logs',
  'updatedAt': 'updated_at',
  'createdAt': 'created_at',
};

Map<String, dynamic> _$UserStatisticToJson(UserStatistic instance) =>
    <String, dynamic>{
      'id': instance.id,
      'weight_logs': instance.weightLogs?.map((e) => e.toJson()).toList(),
      'body_mass_index_logs':
          instance.bodyMassIndexLogs?.map((e) => e.toJson()).toList(),
      'body_fat_percentage_logs':
          instance.bodyFatPercentageLogs?.map((e) => e.toJson()).toList(),
      'steps_logs': instance.stepsLogs?.map((e) => e.toJson()).toList(),
      'heart_rate_logs':
          instance.heartRateLogs?.map((e) => e.toJson()).toList(),
      'sleep_asleep_logs':
          instance.sleepAsleepLogs?.map((e) => e.toJson()).toList(),
      'active_energy_burned_logs':
          instance.activeEnergyBurned?.map((e) => e.toJson()).toList(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
    };
