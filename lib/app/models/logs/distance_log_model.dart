import 'package:equatable/equatable.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'distance_log_model.g.dart';

@JsonSerializable()
@CopyWith()
class DistanceLog extends Equatable {
  final int? id;
  final String? user_statistic_id;
  final double distance;
  final DateTime? updated_at;
  final DateTime created_at;
  DistanceLog({
    this.id,
    this.user_statistic_id,
    required this.distance,
    this.updated_at,
    required this.created_at,
  });

  @override
  List<Object?> get props => [id, user_statistic_id, distance, updated_at, created_at];

  factory DistanceLog.fromJson(Map<String, dynamic> json) => _$DistanceLogFromJson(json);
  Map<String, dynamic> toJson() => _$DistanceLogToJson(this);
}
