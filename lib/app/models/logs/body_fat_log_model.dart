import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'body_fat_log_model.g.dart';

@JsonSerializable()
@CopyWith()
class BodyFatLog extends Equatable {
  final int id;
  final String user_statistic_id;
  final double body_fat;
  final DateTime updated_at;
  final DateTime created_at;
  BodyFatLog({
    required this.user_statistic_id,
    required this.body_fat,
    required this.updated_at,
    required this.created_at,
    required this.id,
  });

  @override
  List<Object?> get props => [id, user_statistic_id, body_fat, updated_at, created_at];

  factory BodyFatLog.fromJson(Map<String, dynamic> json) => _$BodyFatLogFromJson(json);
  Map<String, dynamic> toJson() => _$BodyFatLogToJson(this);
  factory BodyFatLog.empty() => BodyFatLog(created_at: DateTime.now(), body_fat: 0, id: 0, updated_at: DateTime.now(), user_statistic_id: '');
}
//  type HeightLog struct {
// 	ID              uint           `json:"id" gorm:"primaryKey;autoIncrement;not null"`
// 	UserStatisticID string         `json:"user_statistic_id" gorm:"not null"`
// 	Height          float32        `json:"height"`
// 	CreatedAt       time.Time      `json:"created_at"`
// 	UpdatedAt       time.Time      `json:"updated_at"`
// 	DeletedAt       gorm.DeletedAt `json:"deleted_at" gorm:"index"`
// }