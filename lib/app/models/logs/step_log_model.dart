import 'package:FitStack/app/models/logs/log_model.dart';
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

  Map<String, dynamic> toJson() => _$StepsLogToJson(this);
  factory StepsLog.fromJson(Map<String, dynamic> json) => _$StepsLogFromJson(json);

  @override
  List<Object?> get props => [id, createdAt, updatedAt, userId, type, value];

  @override
  factory StepsLog.copyWith({String? id, DateTime? created_at, DateTime? updated_at, String? userId, HealthDataType? type, num? value}) {
    return StepsLog();
  }

  @override
  bool? get stringify => false;

  @override
  factory StepsLog.fromHealthData(HealthDataPoint data) {
    var value = data.value as NumericHealthValue;
    return StepsLog(
      id: null,
      userId: null,
      type: data.type,
      value: value.numericValue,
      createdAt: data.dateFrom.toUtc(),
      updatedAt: data.dateTo.toUtc(),
    );
  }
}
