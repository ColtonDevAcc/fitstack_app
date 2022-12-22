// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'muscle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Muscle _$MuscleFromJson(Map json) => Muscle(
      group: $enumDecode(_$MuscleGroupEnumMap, json['group']),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      recovery: json['recovery'] == null
          ? null
          : MuscleRecovery.fromJson(
              Map<String, dynamic>.from(json['recovery'] as Map)),
      id: json['id'] as int?,
      action: json['action'] as String?,
      child: $enumDecodeNullable(_$ChildMuscleEnumMap, json['child_muscles']),
      image: json['image'] as String?,
    );

const _$MuscleFieldMap = <String, String>{
  'id': 'id',
  'action': 'action',
  'group': 'group',
  'child': 'child_muscles',
  'image': 'image',
  'createdAt': 'created_at',
  'updatedAt': 'updated_at',
  'recovery': 'recovery',
};

Map<String, dynamic> _$MuscleToJson(Muscle instance) => <String, dynamic>{
      'id': instance.id,
      'action': instance.action,
      'group': _$MuscleGroupEnumMap[instance.group]!,
      'child_muscles': _$ChildMuscleEnumMap[instance.child],
      'image': instance.image,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'recovery': instance.recovery?.toJson(),
    };

const _$MuscleGroupEnumMap = {
  MuscleGroup.Arms: 'Arms',
  MuscleGroup.Chest: 'Chest',
  MuscleGroup.Legs: 'Legs',
  MuscleGroup.Abdominals: 'Abdominals',
  MuscleGroup.Glutes: 'Glutes',
  MuscleGroup.Calves: 'Calves',
  MuscleGroup.Forearms: 'Forearms',
  MuscleGroup.Traps: 'Traps',
  MuscleGroup.Neck: 'Neck',
  MuscleGroup.UpperBack: 'UpperBack',
  MuscleGroup.LowerBack: 'LowerBack',
  MuscleGroup.HipFlexors: 'HipFlexors',
  MuscleGroup.Adductors: 'Adductors',
  MuscleGroup.Abductors: 'Abductors',
  MuscleGroup.PlantarFlexors: 'PlantarFlexors',
  MuscleGroup.Dorsiflexors: 'Dorsiflexors',
  MuscleGroup.Invertors: 'Invertors',
  MuscleGroup.Empty: 'Empty',
};

const _$ChildMuscleEnumMap = {
  ChildMuscle.BicepsBrachii: 'BicepsBrachii',
  ChildMuscle.Triceps: 'Triceps',
  ChildMuscle.PectoralisMajor: 'PectoralisMajor',
  ChildMuscle.PectoralisMinor: 'PectoralisMinor',
  ChildMuscle.Quadriceps: 'Quadriceps',
  ChildMuscle.Hamstrings: 'Hamstrings',
  ChildMuscle.RectusAbdominis: 'RectusAbdominis',
  ChildMuscle.Obliques: 'Obliques',
  ChildMuscle.GluteusMaximus: 'GluteusMaximus',
  ChildMuscle.GluteusMedius: 'GluteusMedius',
  ChildMuscle.GluteusMinimus: 'GluteusMinimus',
  ChildMuscle.Gastrocnemius: 'Gastrocnemius',
  ChildMuscle.Soleus: 'Soleus',
  ChildMuscle.Flexors: 'Flexors',
  ChildMuscle.Extensors: 'Extensors',
  ChildMuscle.Sternocleidomastoid: 'Sternocleidomastoid',
  ChildMuscle.Splenius: 'Splenius',
  ChildMuscle.Rhomboids: 'Rhomboids',
  ChildMuscle.LatissimusDorsi: 'LatissimusDorsi',
  ChildMuscle.ErectorSpinae: 'ErectorSpinae',
  ChildMuscle.Iliopsoas: 'Iliopsoas',
  ChildMuscle.RectusFemoris: 'RectusFemoris',
  ChildMuscle.Gracilis: 'Gracilis',
  ChildMuscle.AdductorBrevis: 'AdductorBrevis',
  ChildMuscle.AdductorLongus: 'AdductorLongus',
  ChildMuscle.GluteusMediusMinimus: 'GluteusMediusMinimus',
  ChildMuscle.TensorFasciaeLatae: 'TensorFasciaeLatae',
  ChildMuscle.TibialisAnterior: 'TibialisAnterior',
  ChildMuscle.TibialisPosterior: 'TibialisPosterior',
  ChildMuscle.ExtensorDigitorumLongus: 'ExtensorDigitorumLongus',
  ChildMuscle.FlexorDigitorumLongus: 'FlexorDigitorumLongus',
  ChildMuscle.Empty: 'Empty',
};
