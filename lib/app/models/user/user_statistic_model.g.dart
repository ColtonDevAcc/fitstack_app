// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_statistic_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserStatisticCWProxy {
  UserStatistic stepsLogs(List<StepsLog>? stepsLogs);

  UserStatistic heartRateLogs(List<HeartRateLog>? heartRateLogs);

  UserStatistic sleepAsleepLogs(List<SleepAsleepLog>? sleepAsleepLogs);

  UserStatistic activeEnergyBurned(
      List<ActiveEnergyBurnedLog>? activeEnergyBurned);

  UserStatistic weightLogs(List<WeightLog>? weightLogs);

  UserStatistic bodyMassIndexLogs(List<BodyMassIndexLog>? bodyMassIndexLogs);

  UserStatistic bodyFatPercentageLogs(
      List<BodyFatPercentageLog>? bodyFatPercentageLogs);

  UserStatistic updatedAt(DateTime? updatedAt);

  UserStatistic createdAt(DateTime? createdAt);

  UserStatistic id(String? id);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserStatistic(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserStatistic(...).copyWith(id: 12, name: "My name")
  /// ````
  UserStatistic call({
    List<StepsLog>? stepsLogs,
    List<HeartRateLog>? heartRateLogs,
    List<SleepAsleepLog>? sleepAsleepLogs,
    List<ActiveEnergyBurnedLog>? activeEnergyBurned,
    List<WeightLog>? weightLogs,
    List<BodyMassIndexLog>? bodyMassIndexLogs,
    List<BodyFatPercentageLog>? bodyFatPercentageLogs,
    DateTime? updatedAt,
    DateTime? createdAt,
    String? id,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUserStatistic.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUserStatistic.copyWith.fieldName(...)`
class _$UserStatisticCWProxyImpl implements _$UserStatisticCWProxy {
  const _$UserStatisticCWProxyImpl(this._value);

  final UserStatistic _value;

  @override
  UserStatistic stepsLogs(List<StepsLog>? stepsLogs) =>
      this(stepsLogs: stepsLogs);

  @override
  UserStatistic heartRateLogs(List<HeartRateLog>? heartRateLogs) =>
      this(heartRateLogs: heartRateLogs);

  @override
  UserStatistic sleepAsleepLogs(List<SleepAsleepLog>? sleepAsleepLogs) =>
      this(sleepAsleepLogs: sleepAsleepLogs);

  @override
  UserStatistic activeEnergyBurned(
          List<ActiveEnergyBurnedLog>? activeEnergyBurned) =>
      this(activeEnergyBurned: activeEnergyBurned);

  @override
  UserStatistic weightLogs(List<WeightLog>? weightLogs) =>
      this(weightLogs: weightLogs);

  @override
  UserStatistic bodyMassIndexLogs(List<BodyMassIndexLog>? bodyMassIndexLogs) =>
      this(bodyMassIndexLogs: bodyMassIndexLogs);

  @override
  UserStatistic bodyFatPercentageLogs(
          List<BodyFatPercentageLog>? bodyFatPercentageLogs) =>
      this(bodyFatPercentageLogs: bodyFatPercentageLogs);

  @override
  UserStatistic updatedAt(DateTime? updatedAt) => this(updatedAt: updatedAt);

  @override
  UserStatistic createdAt(DateTime? createdAt) => this(createdAt: createdAt);

  @override
  UserStatistic id(String? id) => this(id: id);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserStatistic(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserStatistic(...).copyWith(id: 12, name: "My name")
  /// ````
  UserStatistic call({
    Object? stepsLogs = const $CopyWithPlaceholder(),
    Object? heartRateLogs = const $CopyWithPlaceholder(),
    Object? sleepAsleepLogs = const $CopyWithPlaceholder(),
    Object? activeEnergyBurned = const $CopyWithPlaceholder(),
    Object? weightLogs = const $CopyWithPlaceholder(),
    Object? bodyMassIndexLogs = const $CopyWithPlaceholder(),
    Object? bodyFatPercentageLogs = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
  }) {
    return UserStatistic(
      stepsLogs: stepsLogs == const $CopyWithPlaceholder()
          ? _value.stepsLogs
          // ignore: cast_nullable_to_non_nullable
          : stepsLogs as List<StepsLog>?,
      heartRateLogs: heartRateLogs == const $CopyWithPlaceholder()
          ? _value.heartRateLogs
          // ignore: cast_nullable_to_non_nullable
          : heartRateLogs as List<HeartRateLog>?,
      sleepAsleepLogs: sleepAsleepLogs == const $CopyWithPlaceholder()
          ? _value.sleepAsleepLogs
          // ignore: cast_nullable_to_non_nullable
          : sleepAsleepLogs as List<SleepAsleepLog>?,
      activeEnergyBurned: activeEnergyBurned == const $CopyWithPlaceholder()
          ? _value.activeEnergyBurned
          // ignore: cast_nullable_to_non_nullable
          : activeEnergyBurned as List<ActiveEnergyBurnedLog>?,
      weightLogs: weightLogs == const $CopyWithPlaceholder()
          ? _value.weightLogs
          // ignore: cast_nullable_to_non_nullable
          : weightLogs as List<WeightLog>?,
      bodyMassIndexLogs: bodyMassIndexLogs == const $CopyWithPlaceholder()
          ? _value.bodyMassIndexLogs
          // ignore: cast_nullable_to_non_nullable
          : bodyMassIndexLogs as List<BodyMassIndexLog>?,
      bodyFatPercentageLogs:
          bodyFatPercentageLogs == const $CopyWithPlaceholder()
              ? _value.bodyFatPercentageLogs
              // ignore: cast_nullable_to_non_nullable
              : bodyFatPercentageLogs as List<BodyFatPercentageLog>?,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime?,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime?,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
    );
  }
}

extension $UserStatisticCopyWith on UserStatistic {
  /// Returns a callable class that can be used as follows: `instanceOfUserStatistic.copyWith(...)` or like so:`instanceOfUserStatistic.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UserStatisticCWProxy get copyWith => _$UserStatisticCWProxyImpl(this);
}

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
