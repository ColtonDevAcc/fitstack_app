import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'weight_log_model.g.dart';

@JsonSerializable()
@CopyWith()
class WeightLog extends Equatable {
  final int id;
  final String user_statistic_id;
  final double weight;
  final DateTime updated_at;
  final DateTime created_at;
  WeightLog({
    required this.user_statistic_id,
    required this.weight,
    required this.updated_at,
    required this.created_at,
    required this.id,
  });

  @override
  List<Object?> get props => [id, user_statistic_id, weight, updated_at, created_at];

  factory WeightLog.fromJson(Map<String, dynamic> json) => _$WeightLogFromJson(json);
  Map<String, dynamic> toJson() => _$WeightLogToJson(this);
  factory WeightLog.empty() => WeightLog(created_at: DateTime.now(), weight: 0, id: 0, updated_at: DateTime.now(), user_statistic_id: '');
}
