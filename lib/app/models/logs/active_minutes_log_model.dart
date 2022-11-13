import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'active_minutes_log_model.g.dart';

@JsonSerializable()
@CopyWith()
class ActiveMinutesLog extends Equatable {
  final int? id;
  final String? user_statistic_id;
  final double active_minutes;
  final DateTime? updated_at;
  final DateTime created_at;

  ActiveMinutesLog({
    this.id,
    this.user_statistic_id,
    required this.active_minutes,
    this.updated_at,
    required this.created_at,
  });

  @override
  List<Object?> get props => [id, user_statistic_id, active_minutes, updated_at, created_at];

  factory ActiveMinutesLog.fromJson(Map<String, dynamic> json) => _$ActiveMinutesLogFromJson(json);
  Map<String, dynamic> toJson() => _$ActiveMinutesLogToJson(this);
}
