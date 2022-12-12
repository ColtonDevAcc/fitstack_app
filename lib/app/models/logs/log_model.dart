import 'package:equatable/equatable.dart';
import 'package:health/health.dart';
import 'package:json_annotation/json_annotation.dart';

abstract class Log extends Equatable {
  @JsonKey(name: 'type')
  final HealthDataType type;
  @JsonKey(name: 'value')
  final num value;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'user_id')
  final String? userId;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  Log({
    required this.createdAt,
    required this.type,
    required this.value,
    this.id,
    this.updatedAt,
    this.userId,
  });

  @override
  String toString() {
    return 'Log { id: $id, created_at: $createdAt, userId: $userId, type: $type, value: $value }';
  }

  Map<String, dynamic> toJson();
  factory Log.fromJson(Map<String, dynamic> json) => throw UnimplementedError();

  factory Log.fromHealthData(HealthDataPoint data) => throw UnimplementedError();

// copy with factory
  factory Log.copyWith({
    int? id,
    DateTime? created_at,
    DateTime? updated_at,
    String? userId,
    HealthDataType? type,
    num? value,
  }) {
    throw UnimplementedError();
  }

  @override
  List<Object?> get props => [id, createdAt, updatedAt, userId, type, value];
}
