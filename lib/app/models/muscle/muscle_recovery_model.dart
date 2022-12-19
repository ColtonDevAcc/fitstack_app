import 'package:equatable/equatable.dart';

import 'package:json_annotation/json_annotation.dart';

part 'muscle_recovery_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true, anyMap: true)
class MuscleRecovery extends Equatable {
  @JsonKey(name: 'recovery_value')
  final int recoveryValue;

  const MuscleRecovery({
    required this.recoveryValue,
  });

  @override
  List<Object?> get props => [recoveryValue];

  MuscleRecovery copyWith({
    int? recoveryValue,
  }) {
    return MuscleRecovery(
      recoveryValue: recoveryValue ?? this.recoveryValue,
    );
  }

  factory MuscleRecovery.fromJson(Map<String, dynamic> json) => _$MuscleRecoveryFromJson(json);

  Map<String, dynamic> toJson() => _$MuscleRecoveryToJson(this);
}
