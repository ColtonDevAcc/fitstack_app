import 'package:FitStack/app/models/logs/log_model.dart';
// ignore: depend_on_referenced_packages
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:health/health.dart';
import 'package:json_annotation/json_annotation.dart';

part 'step_log_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true, anyMap: true)
@CopyWith()
class StepsLog extends Log {
  StepsLog({
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
          type: type ?? HealthDataType.STEPS,
          value: value ?? 0,
        );

  @override
  String toString() {
    return 'StepsLog { id: $id, created_at: $createdAt, userId: $userId, type: $type, value: $value }';
  }

  @override
  Map<String, dynamic> toJson() => _$StepsLogToJson(this);
  factory StepsLog.fromJson(Map<String, dynamic> json) => _$StepsLogFromJson(json);

  @override
  List<Object?> get props => [id, createdAt, updatedAt, userId, type, value];

  @override
  factory StepsLog.copyWith() {
    return StepsLog();
  }

  @override
  bool? get stringify => false;

  @override
  factory StepsLog.fromHealthData(HealthDataPoint data) {
    final value = data.value as NumericHealthValue;
    return StepsLog(
      type: data.type,
      value: value.numericValue,
      createdAt: data.dateFrom.toUtc(),
      updatedAt: data.dateTo.toUtc(),
    );
  }
}
