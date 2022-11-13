import 'package:equatable/equatable.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'body_temperature_log_model.g.dart';

@JsonSerializable()
@CopyWith()
class BodyTemperatureLog extends Equatable {
  final int? id;
  final String? user_statistic_id;
  final double body_temperature;
  final DateTime? updated_at;
  final DateTime? created_at;

  BodyTemperatureLog({
    this.id,
    this.user_statistic_id,
    required this.body_temperature,
    this.updated_at,
    required this.created_at,
  });

  @override
  List<Object?> get props => [id, user_statistic_id, body_temperature, updated_at, created_at];

  factory BodyTemperatureLog.fromJson(Map<String, dynamic> json) => _$BodyTemperatureLogFromJson(json);
  Map<String, dynamic> toJson() => _$BodyTemperatureLogToJson(this);
}
