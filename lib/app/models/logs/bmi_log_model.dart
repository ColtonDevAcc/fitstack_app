import 'package:FitStack/app/models/logs/log_model.dart';
import 'package:health/health.dart';
import 'package:json_annotation/json_annotation.dart';
// ignore: depend_on_referenced_packages
import 'package:copy_with_extension/copy_with_extension.dart';

part 'bmi_log_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true, anyMap: true)
@CopyWith()
class BodyMassIndexLog extends Log {
  BodyMassIndexLog({
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
          type: type ?? HealthDataType.BODY_MASS_INDEX,
          value: value ?? 0,
        );

  double get bmi => value as double;
  double get kgPerMeterSquared => bmi;
  double get kgPerCentimeterSquared => bmi / 10000;
  double get lbPerInchSquared => bmi * 703;

  @override
  String toString() {
    return 'BodyMassIndexLog { id: $id, created_at: $createdAt, userId: $userId, type: $type, value: $value }';
  }

  @override
  Map<String, dynamic> toJson() => _$BodyMassIndexLogToJson(this);
  factory BodyMassIndexLog.fromJson(Map<String, dynamic> json) => _$BodyMassIndexLogFromJson(json);

  @override
  List<Object?> get props => [id, createdAt, updatedAt, userId, type, value];

  @override
  factory BodyMassIndexLog.copyWith() {
    return BodyMassIndexLog();
  }

  @override
  bool? get stringify => false;

  @override
  factory BodyMassIndexLog.fromHealthData(HealthDataPoint data) {
    final value = data.value as NumericHealthValue;
    return BodyMassIndexLog(
      type: data.type,
      value: value.numericValue,
      createdAt: data.dateFrom.toUtc(),
      updatedAt: data.dateTo.toUtc(),
    );
  }
}
