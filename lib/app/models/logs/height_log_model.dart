import 'package:FitStack/app/models/logs/log_model.dart';
import 'package:health/health.dart';
import 'package:json_annotation/json_annotation.dart';

part 'height_log_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true, anyMap: true)
class HeightLog extends Log {
  HeightLog({
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
          type: type ?? HealthDataType.HEIGHT,
          value: value ?? 0,
        );

  @override
  String toString() {
    return 'HeightLog { id: $id, created_at: $createdAt, userId: $userId, type: $type, value: $value }';
  }

  Map<String, dynamic> toJson() => _$HeightLogToJson(this);
  factory HeightLog.fromJson(Map<String, dynamic> json) => _$HeightLogFromJson(json);

  @override
  List<Object?> get props => [id, createdAt, updatedAt, userId, type, value];

  @override
  factory HeightLog.fromHealthData(HealthDataPoint data) {
    var value = data.value as NumericHealthValue;
    return HeightLog(
      id: null,
      userId: null,
      type: data.type,
      value: value.numericValue,
      createdAt: data.dateFrom.toUtc(),
      updatedAt: data.dateTo.toUtc(),
    );
  }
}
