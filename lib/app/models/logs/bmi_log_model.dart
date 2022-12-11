import 'package:FitStack/app/models/logs/log_model.dart';
import 'package:health/health.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'bmi_log_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true, anyMap: true)
@CopyWith()
class BodyMassIndexLog extends Log {
  BodyMassIndexLog({
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
          type: type ?? HealthDataType.BODY_MASS_INDEX,
          value: value ?? 0,
        );

  @override
  String toString() {
    return 'BodyMassIndexLog { id: $id, created_at: $createdAt, userId: $userId, type: $type, value: $value }';
  }

  Map<String, dynamic> toJson() => _$BodyMassIndexLogToJson(this);
  factory BodyMassIndexLog.fromJson(Map<String, dynamic> json) => _$BodyMassIndexLogFromJson(json);

  @override
  List<Object?> get props => [id, createdAt, updatedAt, userId, type, value];

  @override
  factory BodyMassIndexLog.copyWith({String? id, DateTime? created_at, DateTime? updated_at, String? userId, HealthDataType? type, num? value}) {
    return BodyMassIndexLog();
  }

  @override
  bool? get stringify => false;

  @override
  factory BodyMassIndexLog.fromHealthData(HealthDataPoint data) {
    var value = data.value as NumericHealthValue;
    return BodyMassIndexLog(
      id: null,
      userId: null,
      type: data.type,
      value: value.numericValue,
      createdAt: data.dateFrom,
      updatedAt: data.dateTo,
    );
  }
}
