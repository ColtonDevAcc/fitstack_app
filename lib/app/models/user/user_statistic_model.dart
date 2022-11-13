import 'package:FitStack/app/models/logs/bmi_log_model.dart';
import 'package:FitStack/app/models/logs/body_fat_log_model.dart';
import 'package:FitStack/app/models/logs/height_log_model.dart';
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
  final DateTime? updated_at;
  final DateTime? created_at;
  UserStatistic({
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
        id: "0",
        bmi_log: [],
        body_fat_log: [],
        created_at: null,
        height_log: [],
        updated_at: null,
        weight_log: [],
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