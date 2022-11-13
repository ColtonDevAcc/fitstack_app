import 'package:equatable/equatable.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'heart_rate_log_model.g.dart';

@JsonSerializable()
@CopyWith()
class HeartRateLog extends Equatable {
  final int? id;
  final String? user_statistic_id;
  final double heart_rate;
  final DateTime? updated_at;
  final DateTime created_at;

  HeartRateLog({
    this.id,
    this.user_statistic_id,
    required this.heart_rate,
    this.updated_at,
    required this.created_at,
  });

  @override
  List<Object?> get props => [id, user_statistic_id, heart_rate, updated_at, created_at];

  factory HeartRateLog.fromJson(Map<String, dynamic> json) => _$HeartRateLogFromJson(json);
  Map<String, dynamic> toJson() => _$HeartRateLogToJson(this);
}
