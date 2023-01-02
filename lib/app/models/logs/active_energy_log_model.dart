import 'package:FitStack/app/models/logs/log_model.dart';
import 'package:health/health.dart';
import 'package:json_annotation/json_annotation.dart';
part 'active_energy_log_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true, anyMap: true)
class ActiveEnergyBurnedLog extends Log {
  ActiveEnergyBurnedLog({
    int? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? userId,
    HealthDataType? type,
    //this is calories
    num? value,
  }) : super(
          id: id,
          createdAt: createdAt ?? DateTime.now(),
          updatedAt: updatedAt,
          userId: userId,
          type: type ?? HealthDataType.ACTIVE_ENERGY_BURNED,
          value: value ?? 0,
        );

  double get calories => value * 1000;
  double get kiloCalories => calories / 1000;
  double get kiloJoules => kiloCalories * 4.184;
  double get joules => kiloJoules * 1000;
  double get kiloWattHours => kiloJoules / 3600;
  double get wattHours => kiloWattHours * 1000;
  double get kiloWattSeconds => kiloWattHours / 3600;
  double get wattSeconds => kiloWattSeconds * 1000;
  double get kiloWattMinutes => kiloWattHours / 60;

  @override
  String toString() {
    return 'ActiveEnergyBurnedLog { id: $id, created_at: $createdAt, userId: $userId, type: $type, value: $value }';
  }

  @override
  Map<String, dynamic> toJson() => _$ActiveEnergyBurnedLogToJson(this);
  factory ActiveEnergyBurnedLog.fromJson(Map<String, dynamic> json) => _$ActiveEnergyBurnedLogFromJson(json);

  @override
  List<Object?> get props => [id, createdAt, updatedAt, userId, type, value];

  @override
  factory ActiveEnergyBurnedLog.fromHealthData(HealthDataPoint data) {
    final value = data.value as NumericHealthValue;
    return ActiveEnergyBurnedLog(
      type: data.type,
      value: value.numericValue,
      createdAt: data.dateFrom.toUtc(),
      updatedAt: data.dateTo.toUtc(),
    );
  }
}
