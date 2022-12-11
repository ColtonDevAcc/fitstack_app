import 'package:FitStack/app/models/logs/log_model.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:health/health.dart';
import 'package:json_annotation/json_annotation.dart';

part 'heart_rate_log_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true, anyMap: true)
@CopyWith()
class HeartRateLog extends Log {
  HeartRateLog({
    String? id,
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

  Map<String, dynamic> toJson() => _$HeartRateLogToJson(this);
  factory HeartRateLog.fromJson(Map<String, dynamic> json) => _$HeartRateLogFromJson(json);

  @override
  List<Object?> get props => [id, createdAt, updatedAt, userId, type, value];

  @override
  factory HeartRateLog.copyWith({String? id, DateTime? created_at, DateTime? updated_at, String? userId, HealthDataType? type, num? value}) {
    return HeartRateLog();
  }

  @override
  bool? get stringify => false;

  @override
  factory HeartRateLog.fromHealthData(HealthDataPoint data) {
    var value = data.value as NumericHealthValue;
    return HeartRateLog(
      id: null,
      userId: null,
      type: data.type,
      value: value.numericValue,
      createdAt: data.dateFrom,
      updatedAt: data.dateTo,
    );
  }
}
