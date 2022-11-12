import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'height_log_model.g.dart';

@JsonSerializable()
@CopyWith()
class HeightLog extends Equatable {
  final int? id;
  final String? user_statistic_id;
  final double height;
  final DateTime? updated_at;
  final DateTime? created_at;
  HeightLog({
    this.user_statistic_id,
    required this.height,
    this.updated_at,
    this.created_at,
    this.id,
  });

  @override
  List<Object?> get props => [id, user_statistic_id, height, updated_at, created_at];

  factory HeightLog.fromJson(Map<String, dynamic> json) => _$HeightLogFromJson(json);
  Map<String, dynamic> toJson() => _$HeightLogToJson(this);
  factory HeightLog.empty() =>
      HeightLog(created_at: DateTime.now().toUtc(), height: 0, id: 0, updated_at: DateTime.now().toUtc(), user_statistic_id: '');
}
//  type HeightLog struct {
// 	ID              uint           `json:"id" gorm:"primaryKey;autoIncrement;not null"`
// 	UserStatisticID string         `json:"user_statistic_id" gorm:"not null"`
// 	Height          float32        `json:"height"`
// 	CreatedAt       time.Time      `json:"created_at"`
// 	UpdatedAt       time.Time      `json:"updated_at"`
// 	DeletedAt       gorm.DeletedAt `json:"deleted_at" gorm:"index"`
// }