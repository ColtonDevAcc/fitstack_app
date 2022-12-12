import 'package:FitStack/app/models/logs/log_model.dart';
import 'package:health/health.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'sleep_asleep_log_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true, anyMap: true)
@CopyWith()
class SleepAsleepLog extends Log {
  SleepAsleepLog({
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
          type: type ?? HealthDataType.SLEEP_ASLEEP,
          value: value ?? 0,
        );

  @override
  String toString() {
    return 'SleepLog { id: $id, created_at: $createdAt, userId: $userId, type: $type, value: $value }';
  }

  Map<String, dynamic> toJson() => _$SleepAsleepLogToJson(this);
  factory SleepAsleepLog.fromJson(Map<String, dynamic> json) => _$SleepAsleepLogFromJson(json);

  @override
  List<Object?> get props => [id, createdAt, updatedAt, userId, type, value];

  @override
  factory SleepAsleepLog.copyWith({String? id, DateTime? created_at, DateTime? updated_at, String? userId, HealthDataType? type, num? value}) {
    return SleepAsleepLog();
  }

  @override
  bool? get stringify => false;

  @override
  factory SleepAsleepLog.fromHealthData(HealthDataPoint data) {
    var value = data.value as NumericHealthValue;
    return SleepAsleepLog(
      id: null,
      userId: null,
      type: data.type,
      value: value.numericValue,
      createdAt: data.dateFrom.toUtc(),
      updatedAt: data.dateTo.toUtc(),
    );
  }
}
