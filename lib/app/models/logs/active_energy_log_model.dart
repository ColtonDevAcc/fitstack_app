import 'package:FitStack/app/models/logs/log_model.dart';
import 'package:health/health.dart';
import 'package:json_annotation/json_annotation.dart';
part 'active_energy_log_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true, anyMap: true)
class ActiveEnergyBurnedLog extends Log {
  ActiveEnergyBurnedLog({
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
          type: type ?? HealthDataType.ACTIVE_ENERGY_BURNED,
          value: value ?? 0,
        );

  @override
  String toString() {
    return 'ActiveEnergyBurnedLog { id: $id, created_at: $createdAt, userId: $userId, type: $type, value: $value }';
  }

  Map<String, dynamic> toJson() => _$ActiveEnergyBurnedLogToJson(this);
  factory ActiveEnergyBurnedLog.fromJson(Map<String, dynamic> json) => _$ActiveEnergyBurnedLogFromJson(json);

  @override
  List<Object?> get props => [id, createdAt, updatedAt, userId, type, value];

  @override
  factory ActiveEnergyBurnedLog.fromHealthData(HealthDataPoint data) {
    var value = data.value as NumericHealthValue;
    return ActiveEnergyBurnedLog(
      id: null,
      userId: null,
      type: data.type,
      value: value.numericValue,
      createdAt: data.dateFrom,
      updatedAt: data.dateTo,
    );
  }
}
