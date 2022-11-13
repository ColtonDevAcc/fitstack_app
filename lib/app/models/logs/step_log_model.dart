import 'package:equatable/equatable.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'step_log_model.g.dart';

@JsonSerializable()
@CopyWith()
class StepLog extends Equatable {
  final int? id;
  final String? user_statistic_id;
  final int step_count;
  final DateTime? updated_at;
  final DateTime? created_at;
  StepLog({
    this.user_statistic_id,
    required this.step_count,
    this.updated_at,
    this.created_at,
    this.id,
  });

  @override
  List<Object?> get props => [id, user_statistic_id, step_count, updated_at, created_at];

  factory StepLog.fromJson(Map<String, dynamic> json) => _$StepLogFromJson(json);
  Map<String, dynamic> toJson() => _$StepLogToJson(this);

  factory StepLog.empty() =>
      StepLog(created_at: DateTime.now().toUtc(), step_count: 0, id: 0, updated_at: DateTime.now().toUtc(), user_statistic_id: '');
}
