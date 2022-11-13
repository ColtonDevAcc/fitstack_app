import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'basal_energy_log_model.g.dart';

@JsonSerializable()
@CopyWith()
class BasalEnergyLog extends Equatable {
  final int? id;
  final String? user_statistic_id;
  final double basal_energy;
  final DateTime? updated_at;
  final DateTime created_at;

  BasalEnergyLog({
    this.id,
    this.user_statistic_id,
    required this.basal_energy,
    this.updated_at,
    required this.created_at,
  });

  @override
  List<Object?> get props => [id, user_statistic_id, basal_energy, updated_at, created_at];

  factory BasalEnergyLog.fromJson(Map<String, dynamic> json) => _$BasalEnergyLogFromJson(json);
  Map<String, dynamic> toJson() => _$BasalEnergyLogToJson(this);
}
