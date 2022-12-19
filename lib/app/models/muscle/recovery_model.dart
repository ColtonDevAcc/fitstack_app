import 'package:FitStack/app/models/muscle/muscle_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recovery_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true, anyMap: true)
class Recovery extends Equatable {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'muscles')
  final List<Muscle> muscles;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  const Recovery({
    required this.id,
    required this.muscles,
    required this.updatedAt,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, muscles, updatedAt, createdAt];

  factory Recovery.fromJson(Map<String, dynamic> json) => _$RecoveryFromJson(json);

  Map<String, dynamic> toJson() => _$RecoveryToJson(this);

  Recovery copyWith({
    String? id,
    List<Muscle>? muscles,
    DateTime? updatedAt,
    DateTime? createdAt,
  }) {
    return Recovery(
      id: id ?? this.id,
      muscles: muscles ?? this.muscles,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  //empty factory
  factory Recovery.empty() => Recovery(
        id: '0',
        muscles: const [],
        updatedAt: DateTime.now(),
        createdAt: DateTime.now(),
      );
}
