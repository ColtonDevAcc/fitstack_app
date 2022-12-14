import 'package:FitStack/app/models/logs/log_model.dart';
import 'package:health/health.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'body_fat_log_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true, anyMap: true)
@CopyWith()
class BodyFatPercentageLog extends Log {
  BodyFatPercentageLog({
    int? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? userId,
    HealthDataType? type,
    num? value,
  }) : super(
          id: id,
          createdAt: createdAt ?? DateTime.now(),
          updatedAt: updatedAt,
          userId: userId,
          type: type ?? HealthDataType.BODY_FAT_PERCENTAGE,
          value: value ?? 0,
        );

  @override
  String toString() {
    return 'BodyFatPercentageLog { id: $id, created_at: $createdAt, userId: $userId, type: $type, value: $value }';
  }

  @override
  Map<String, dynamic> toJson() => _$BodyFatPercentageLogToJson(this);
  factory BodyFatPercentageLog.fromJson(Map<String, dynamic> json) => _$BodyFatPercentageLogFromJson(json);

  @override
  List<Object?> get props => [id, createdAt, updatedAt, userId, type, value];

  @override
  factory BodyFatPercentageLog.copyWith() {
    return BodyFatPercentageLog();
  }

  @override
  bool? get stringify => false;

  @override
  factory BodyFatPercentageLog.fromHealthData(HealthDataPoint data) {
    final value = data.value as NumericHealthValue;
    return BodyFatPercentageLog(
      type: data.type,
      value: value.numericValue,
      createdAt: data.dateFrom.toUtc(),
      updatedAt: data.dateTo.toUtc(),
    );
  }
}
