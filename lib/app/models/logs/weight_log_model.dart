import 'package:FitStack/app/models/logs/log_model.dart';
import 'package:health/health.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:units_converter/models/extension_converter.dart';
import 'package:units_converter/properties/mass.dart';

part 'weight_log_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true, anyMap: true)
@CopyWith()
class WeightLog extends Log {
  WeightLog({
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
          type: type ?? HealthDataType.WEIGHT,
          value: value ?? 0,
        );

  @override
  String toString() {
    return 'WeightLog { id: $id, created_at: $createdAt, userId: $userId, type: $type, value: $value }';
  }

  Map<String, dynamic> toJson() => _$WeightLogToJson(this);
  factory WeightLog.fromJson(Map<String, dynamic> json) => _$WeightLogFromJson(json);

  @override
  List<Object?> get props => [id, createdAt, updatedAt, userId, type, value];

  @override
  factory WeightLog.copyWith({String? id, DateTime? created_at, DateTime? updated_at, String? userId, HealthDataType? type, num? value}) {
    return WeightLog();
  }

  @override
  bool? get stringify => false;

  @override
  factory WeightLog.fromHealthData(HealthDataPoint data) {
    var value = data.value as NumericHealthValue;
    return WeightLog(
      id: null,
      userId: null,
      type: data.type,
      value: value.numericValue,
      createdAt: data.dateFrom,
      updatedAt: data.dateTo,
    );
  }

  double? get valueInPounds => value.convertFromTo(MASS.kilograms, MASS.pounds);
}
