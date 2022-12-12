import 'package:FitStack/app/models/logs/log_model.dart';
import 'package:health/health.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'active_minutes_log_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true, anyMap: true)
@CopyWith()
class ActiveMinutesLog extends Log {
  ActiveMinutesLog({
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
          type: type ?? HealthDataType.ACTIVE_ENERGY_BURNED,
          value: value ?? 0,
        );

  @override
  String toString() {
    return 'ActiveMinutesLog { id: $id, created_at: $createdAt, userId: $userId, type: $type, value: $value }';
  }

  Map<String, dynamic> toJson() => _$ActiveMinutesLogToJson(this);
  factory ActiveMinutesLog.fromJson(Map<String, dynamic> json) => _$ActiveMinutesLogFromJson(json);

  @override
  List<Object?> get props => [id, createdAt, updatedAt, userId, type, value];

  @override
  factory ActiveMinutesLog.copyWith({String? id, DateTime? created_at, DateTime? updated_at, String? userId, HealthDataType? type, num? value}) {
    return ActiveMinutesLog();
  }

  @override
  bool? get stringify => false;

  @override
  factory ActiveMinutesLog.fromHealthData(HealthDataPoint data) {
    var value = data.value as NumericHealthValue;
    return ActiveMinutesLog(
      id: null,
      userId: null,
      type: data.type,
      value: value.numericValue,
      createdAt: data.dateFrom.toUtc(),
      updatedAt: data.dateTo.toUtc(),
    );
  }
}
