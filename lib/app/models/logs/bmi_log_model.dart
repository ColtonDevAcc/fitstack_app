import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'bmi_log_model.g.dart';

@JsonSerializable()
@CopyWith()
class BMILog extends Equatable {
  final int id;
  final String user_statistic_id;
  final double bmi;
  final DateTime updated_at;
  final DateTime created_at;
  BMILog({
    required this.user_statistic_id,
    required this.bmi,
    required this.updated_at,
    required this.created_at,
    required this.id,
  });

  @override
  List<Object?> get props => [id, user_statistic_id, bmi, updated_at, created_at];

  factory BMILog.fromJson(Map<String, dynamic> json) => _$BMILogFromJson(json);
  Map<String, dynamic> toJson() => _$BMILogToJson(this);
  factory BMILog.empty() => BMILog(created_at: DateTime.now(), bmi: 0, id: 0, updated_at: DateTime.now(), user_statistic_id: '');
}
//  type HeightLog struct {
// 	ID              uint           `json:"id" gorm:"primaryKey;autoIncrement;not null"`
// 	UserStatisticID string         `json:"user_statistic_id" gorm:"not null"`
// 	Height          float32        `json:"height"`
// 	CreatedAt       time.Time      `json:"created_at"`
// 	UpdatedAt       time.Time      `json:"updated_at"`
// 	DeletedAt       gorm.DeletedAt `json:"deleted_at" gorm:"index"`
// }