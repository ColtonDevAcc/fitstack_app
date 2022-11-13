import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'oxygen_saturation_log_model.g.dart';

@JsonSerializable()
@CopyWith()
class OxygenSaturationLog extends Equatable {
  final int? id;
  final String? user_statistic_id;
  final double oxygen_saturation;
  final DateTime? updated_at;
  final DateTime? created_at;

  OxygenSaturationLog({
    this.id,
    this.user_statistic_id,
    required this.oxygen_saturation,
    this.updated_at,
    required this.created_at,
  });

  factory OxygenSaturationLog.fromJson(Map<String, dynamic> json) => _$OxygenSaturationLogFromJson(json);
  Map<String, dynamic> toJson() => _$OxygenSaturationLogToJson(this);

  @override
  List<Object?> get props => [id, user_statistic_id, oxygen_saturation, updated_at, created_at];
}
