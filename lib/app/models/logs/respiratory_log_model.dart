import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'respiratory_log_model.g.dart';

@JsonSerializable()
@CopyWith()
class RespiratoryLog extends Equatable {
  final int id;
  final String? user_statistic_id;
  final double respiratory;
  final DateTime? updated_at;
  final DateTime? created_at;

  RespiratoryLog({
    required this.id,
    this.user_statistic_id,
    required this.respiratory,
    this.updated_at,
    this.created_at,
  });

  @override
  List<Object?> get props => [id, user_statistic_id, respiratory, updated_at, created_at];

  factory RespiratoryLog.fromJson(Map<String, dynamic> json) => _$RespiratoryLogFromJson(json);
  Map<String, dynamic> toJson() => _$RespiratoryLogToJson(this);
}
