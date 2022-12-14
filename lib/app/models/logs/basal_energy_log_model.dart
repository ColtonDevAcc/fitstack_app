import 'package:FitStack/app/models/logs/log_model.dart';
import 'package:health/health.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'basal_energy_log_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true, anyMap: true)
@CopyWith()
class BasalEnergyLog extends Log {
  BasalEnergyLog({
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
          type: type ?? HealthDataType.BASAL_ENERGY_BURNED,
          value: value ?? 0,
        );

  @override
  String toString() {
    return 'BasalEnergyLog { id: $id, created_at: $createdAt, userId: $userId, type: $type, value: $value }';
  }

  @override
  Map<String, dynamic> toJson() => _$BasalEnergyLogToJson(this);
  factory BasalEnergyLog.fromJson(Map<String, dynamic> json) => _$BasalEnergyLogFromJson(json);

  @override
  List<Object?> get props => [id, createdAt, updatedAt, userId, type, value];

  @override
  factory BasalEnergyLog.copyWith() {
    return BasalEnergyLog();
  }

  @override
  bool? get stringify => false;

  @override
  factory BasalEnergyLog.fromHealthData(HealthDataPoint data) {
    final value = data.value as NumericHealthValue;
    return BasalEnergyLog(
      type: data.type,
      value: value.numericValue,
      createdAt: data.dateFrom.toUtc(),
      updatedAt: data.dateTo.toUtc(),
    );
  }
}
