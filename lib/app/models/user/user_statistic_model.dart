import 'package:FitStack/app/models/logs/active_energy_log_model.dart';
import 'package:FitStack/app/models/logs/bmi_log_model.dart';
import 'package:FitStack/app/models/logs/body_fat_log_model.dart';
import 'package:FitStack/app/models/logs/heart_rate_log_model.dart';
import 'package:FitStack/app/models/logs/sleep_asleep_log_model.dart';
import 'package:FitStack/app/models/logs/step_log_model.dart';
import 'package:FitStack/app/models/logs/weight_log_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_statistic_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true, anyMap: true)
class UserStatistic extends Equatable {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'weight_logs')
  final List<WeightLog>? weightLogs;
  @JsonKey(name: 'body_mass_index_logs')
  final List<BodyMassIndexLog>? bodyMassIndexLogs;
  @JsonKey(name: 'body_fat_percentage_logs')
  final List<BodyFatPercentageLog>? bodyFatPercentageLogs;
  @JsonKey(name: 'steps_logs')
  final List<StepsLog>? stepsLogs;
  @JsonKey(name: 'heart_rate_logs')
  final List<HeartRateLog>? heartRateLogs;
  @JsonKey(name: 'sleep_asleep_logs')
  final List<SleepAsleepLog>? sleepAsleepLogs;
  @JsonKey(name: 'active_energy_burned_logs')
  final List<ActiveEnergyBurnedLog>? activeEnergyBurned;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  const UserStatistic({
    this.stepsLogs,
    this.heartRateLogs,
    this.sleepAsleepLogs,
    this.activeEnergyBurned,
    this.weightLogs,
    this.bodyMassIndexLogs,
    this.bodyFatPercentageLogs,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  @override
  List<Object?> get props => [id, weightLogs, bodyMassIndexLogs, bodyFatPercentageLogs, updatedAt, createdAt];

  factory UserStatistic.fromJson(Map<String, dynamic> json) => _$UserStatisticFromJson(json);
  Map<String, dynamic> toJson() => _$UserStatisticToJson(this);
  factory UserStatistic.empty() => UserStatistic(
        updatedAt: DateTime(1).toUtc(),
        createdAt: DateTime(1).toUtc(),
      );

  UserStatistic copyWith({
    String? id,
    List<WeightLog>? weightLogs,
    List<BodyMassIndexLog>? bodyMassIndexLogs,
    List<BodyFatPercentageLog>? bodyFatPercentageLogs,
    List<StepsLog>? stepsLogs,
    List<HeartRateLog>? heartRateLogs,
    List<SleepAsleepLog>? sleepAsleepLogs,
    List<ActiveEnergyBurnedLog>? activeEnergyBurned,
    DateTime? updatedAt,
    DateTime? createdAt,
  }) {
    return UserStatistic(
      id: id ?? this.id,
      weightLogs: weightLogs ?? this.weightLogs,
      bodyMassIndexLogs: bodyMassIndexLogs ?? this.bodyMassIndexLogs,
      bodyFatPercentageLogs: bodyFatPercentageLogs ?? this.bodyFatPercentageLogs,
      stepsLogs: stepsLogs ?? this.stepsLogs,
      heartRateLogs: heartRateLogs ?? this.heartRateLogs,
      sleepAsleepLogs: sleepAsleepLogs ?? this.sleepAsleepLogs,
      activeEnergyBurned: activeEnergyBurned ?? this.activeEnergyBurned,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
