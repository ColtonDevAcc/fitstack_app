import 'package:FitStack/app/models/logs/active_energy_log_model.dart';
import 'package:FitStack/app/models/logs/active_minutes_log_model.dart';
import 'package:FitStack/app/models/logs/blood_pressure_log_model.dart';
import 'package:FitStack/app/models/logs/bmi_log_model.dart';
import 'package:FitStack/app/models/logs/body_fat_log_model.dart';
import 'package:FitStack/app/models/logs/body_temperature_log_model.dart';
import 'package:FitStack/app/models/logs/distance_log_model.dart';
import 'package:FitStack/app/models/logs/heart_rate_log_model.dart';
import 'package:FitStack/app/models/logs/height_log_model.dart';
import 'package:FitStack/app/models/logs/oxygen_saturation_log_model.dart';
import 'package:FitStack/app/models/logs/respiratory_log_model.dart';
import 'package:FitStack/app/models/logs/sleep_log_model.dart';
import 'package:FitStack/app/models/logs/step_log_model.dart';
import 'package:FitStack/app/models/logs/weight_log_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'user_statistic_model.g.dart';

@JsonSerializable()
@CopyWith()
class UserStatistic extends Equatable {
  final String? id;
  final List<HeightLog>? height_log;
  final List<WeightLog>? weight_log;
  final List<BMILog>? bmi_log;
  final List<BodyFatLog>? body_fat_log;
  final List<StepLog>? step_log;
  final List<DistanceLog>? distance_log;
  final List<ActiveMinutesLog>? active_minutes_log;
  final List<HeartRateLog>? heart_rate_log;
  final List<SleepLog>? sleep_log;
  final List<BloodPressureLog>? blood_pressure_log;
  final List<BodyTemperatureLog>? body_temperature;
  final List<RespiratoryLog>? respiratory_rate;
  final List<OxygenSaturationLog>? oxygen_saturation;
  final List<ActiveEnergyLog>? active_energy;
  final DateTime? updated_at;
  final DateTime? created_at;
  UserStatistic({
    this.step_log,
    this.distance_log,
    this.active_minutes_log,
    this.heart_rate_log,
    this.sleep_log,
    this.blood_pressure_log,
    this.body_temperature,
    this.respiratory_rate,
    this.oxygen_saturation,
    this.active_energy,
    this.height_log,
    this.weight_log,
    this.bmi_log,
    this.body_fat_log,
    this.updated_at,
    this.created_at,
    this.id,
  });

  @override
  List<Object?> get props => [id, height_log, weight_log, bmi_log, body_fat_log, updated_at, created_at];

  factory UserStatistic.fromJson(Map<String, dynamic> json) => _$UserStatisticFromJson(json);
  Map<String, dynamic> toJson() => _$UserStatisticToJson(this);
  factory UserStatistic.empty() => UserStatistic(
        updated_at: DateTime(1),
        created_at: DateTime(1),
      );
}


//  ID          string         `json:"id" gorm:"primaryKey;"`
// 	HeightLogs  []HeightLog    `json:"height_log" gorm:"foreignKey:UserStatisticID"`
// 	WeightLogs  []WeightLog    `json:"weight_log" gorm:"foreignKey:UserStatisticID"`
// 	BMILogs     []BMILog       `json:"bmi_log" gorm:"foreignKey:UserStatisticID"`
// 	BodyFatLogs []BodyFatLog   `json:"body_fat_log" gorm:"foreignKey:UserStatisticID"`
// 	CreatedAt   time.Time      `json:"created_at"`
// 	UpdatedAt   time.Time      `json:"updated_at"`
// 	DeletedAt   gorm.DeletedAt `json:"deleted_at" gorm:"index"`