import 'package:equatable/equatable.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'sleep_log_model.g.dart';

@JsonSerializable()
@CopyWith()
class SleepLog extends Equatable {
  final int? id;
  final String? user_statistic_id;
  final double sleep;
  final DateTime? updated_at;
  final DateTime created_at;

  SleepLog({
    this.id,
    this.user_statistic_id,
    required this.sleep,
    this.updated_at,
    required this.created_at,
  });

  @override
  List<Object?> get props => [id, user_statistic_id, sleep, updated_at, created_at];

  factory SleepLog.fromJson(Map<String, dynamic> json) => _$SleepLogFromJson(json);
  Map<String, dynamic> toJson() => _$SleepLogToJson(this);
}
