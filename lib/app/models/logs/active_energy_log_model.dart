import 'package:equatable/equatable.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'active_energy_log_model.g.dart';

@JsonSerializable()
@CopyWith()
class ActiveEnergyLog extends Equatable {
  final int? id;
  final String? user_statistic_id;
  final double active_energy;
  final DateTime? updated_at;
  final DateTime? created_at;

  ActiveEnergyLog({
    this.id,
    this.user_statistic_id,
    required this.active_energy,
    this.updated_at,
    required this.created_at,
  });

  @override
  List<Object?> get props => [id, user_statistic_id, active_energy, updated_at, created_at];

  factory ActiveEnergyLog.fromJson(Map<String, dynamic> json) => _$ActiveEnergyLogFromJson(json);
  Map<String, dynamic> toJson() => _$ActiveEnergyLogToJson(this);
}
