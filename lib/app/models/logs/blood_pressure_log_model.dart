import 'package:equatable/equatable.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'blood_pressure_log_model.g.dart';

@JsonSerializable()
@CopyWith()
class BloodPressureLog extends Equatable {
  final int? id;
  final String? user_statistic_id;
  final double? systolic;
  final double? diastolic;
  final DateTime? updated_at;
  final DateTime created_at;

  BloodPressureLog({
    this.id,
    this.user_statistic_id,
    this.systolic,
    this.diastolic,
    this.updated_at,
    required this.created_at,
  });

  factory BloodPressureLog.fromJson(Map<String, dynamic> json) => _$BloodPressureLogFromJson(json);
  Map<String, dynamic> toJson() => _$BloodPressureLogToJson(this);

  @override
  List<Object?> get props => [id, user_statistic_id, systolic, diastolic, updated_at, created_at];
}
