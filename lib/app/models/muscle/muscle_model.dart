// ignore_for_file: constant_identifier_names

import 'dart:ui';

import 'package:FitStack/app/models/muscle/muscle_recovery_model.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'muscle_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true, anyMap: true)
@HiveType(typeId: 0)
// ignore: must_be_immutable
class Muscle extends Equatable with HiveObjectMixin {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'action')
  final String? action;
  @JsonKey(name: 'group')
  @HiveField(2)
  final MuscleGroup group;
  @JsonKey(name: 'child')
  @HiveField(3)
  final ChildMuscle? child;
  @JsonKey(ignore: true)
  @HiveField(4)
  final String? name;
  @JsonKey(name: 'image')
  final String? image;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @JsonKey(ignore: true)
  @HiveField(8)
  final Path? svgPath;
  @JsonKey(name: 'recovery')
  final MuscleRecovery? recovery;
  Muscle({
    required this.group,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.recovery,
    this.id,
    this.action,
    this.svgPath,
    this.child,
    this.image,
  });

  @override
  List<Object?> get props => [group, name, image, svgPath, child, recovery, id, action, createdAt, updatedAt];

  Muscle copyWith({
    int? id,
    String? action,
    MuscleGroup? group,
    String? name,
    String? image,
    Path? svgPath,
    ChildMuscle? child,
    MuscleRecovery? recovery,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Muscle(
      id: id ?? this.id,
      action: action ?? this.action,
      child: child ?? this.child,
      group: group ?? this.group,
      name: name ?? this.name,
      image: image ?? this.image,
      svgPath: svgPath ?? this.svgPath,
      recovery: recovery ?? this.recovery,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory Muscle.fromJson(Map<String, dynamic> json) => _$MuscleFromJson(json);

  Map<String, dynamic> toJson() => _$MuscleToJson(this);

  factory Muscle.empty() => Muscle(
        group: MuscleGroup.Empty,
      );
}

@HiveType(typeId: 2)
enum MuscleGroup {
  @HiveField(0)
  Arms,
  @HiveField(1)
  Chest,
  @HiveField(2)
  Legs,
  @HiveField(3)
  Abdominals,
  @HiveField(4)
  Glutes,
  @HiveField(5)
  Calves,
  @HiveField(6)
  Forearms,
  @HiveField(7)
  Traps,
  @HiveField(8)
  Neck,
  @HiveField(9)
  UpperBack,
  @HiveField(10)
  LowerBack,
  @HiveField(11)
  HipFlexors,
  @HiveField(12)
  Adductors,
  @HiveField(13)
  Abductors,
  @HiveField(14)
  PlantarFlexors,
  @HiveField(15)
  Dorsiflexors,
  @HiveField(16)
  Invertors,
  @HiveField(17)
  Empty,
}

enum ChildMuscle {
  BicepsBrachii,
  Triceps,
  PectoralisMajor,
  PectoralisMinor,
  Quadriceps,
  Hamstrings,
  RectusAbdominis,
  Obliques,
  GluteusMaximus,
  GluteusMedius,
  GluteusMinimus,
  Gastrocnemius,
  Soleus,
  Flexors,
  Extensors,
  Sternocleidomastoid,
  Splenius,
  Rhomboids,
  LatissimusDorsi,
  ErectorSpinae,
  Iliopsoas,
  RectusFemoris,
  Gracilis,
  AdductorBrevis,
  AdductorLongus,
  GluteusMediusMinimus,
  TensorFasciaeLatae,
  TibialisAnterior,
  TibialisPosterior,
  ExtensorDigitorumLongus,
  FlexorDigitorumLongus,
  Empty,
}

const Map<MuscleGroup, List<String>> muscleMap = {
  MuscleGroup.Chest: ['Pectoralis Major', 'Pectoralis Minor'],
  MuscleGroup.Arms: ['Biceps Brachii', 'Triceps'],
  MuscleGroup.Legs: ['Quadriceps', 'Hamstrings'],
  MuscleGroup.Abdominals: ['Rectus Abdominis', 'Obliques'],
  MuscleGroup.Glutes: ['Gluteus Maximus', 'Gluteus Medius', 'Gluteus Minimus'],
  MuscleGroup.Calves: ['Gastrocnemius', 'Soleus'],
  MuscleGroup.Forearms: ['Flexors', 'Extensors', 'flexor carpi'],
  MuscleGroup.Traps: ['Sternocleidomastoid', 'Splenius'],
  MuscleGroup.Neck: ['Sternocleidomastoid'],
  MuscleGroup.UpperBack: ['Rhomboids', 'Latissimus Dorsi'],
  MuscleGroup.LowerBack: ['Erector Spinae'],
  MuscleGroup.HipFlexors: ['Iliopsoas'],
  MuscleGroup.Adductors: ['Rectus Femoris', 'Gracilis', 'Adductor Brevis', 'Adductor Longus'],
  MuscleGroup.Abductors: ['Gluteus Medius Minimus'],
  MuscleGroup.Dorsiflexors: [],
  MuscleGroup.Invertors: [],
};
