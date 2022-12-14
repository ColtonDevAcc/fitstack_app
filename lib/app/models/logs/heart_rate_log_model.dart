import 'package:FitStack/app/models/logs/log_model.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:health/health.dart';
import 'package:json_annotation/json_annotation.dart';

part 'heart_rate_log_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true, anyMap: true)
@CopyWith()
class HeartRateLog extends Log {
  HeartRateLog({
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
          type: type ?? HealthDataType.HEART_RATE,
          value: value ?? 0,
        );

  @override
  String toString() {
    return 'HeartRateLog { id: $id, created_at: $createdAt, userId: $userId, type: $type, value: $value }';
  }

  @override
  Map<String, dynamic> toJson() => _$HeartRateLogToJson(this);
  factory HeartRateLog.fromJson(Map<String, dynamic> json) => _$HeartRateLogFromJson(json);

  @override
  List<Object?> get props => [id, createdAt, updatedAt, userId, type, value];

  @override
  factory HeartRateLog.copyWith() {
    return HeartRateLog();
  }

  @override
  bool? get stringify => false;

  @override
  factory HeartRateLog.fromHealthData(HealthDataPoint data) {
    final value = data.value as NumericHealthValue;
    return HeartRateLog(
      type: data.type,
      value: value.numericValue,
      createdAt: data.dateFrom.toUtc(),
      updatedAt: data.dateTo.toUtc(),
    );
  }
}
