// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'muscle_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MuscleAdapter extends TypeAdapter<Muscle> {
  @override
  final int typeId = 0;

  @override
  Muscle read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Muscle(
      group: fields[2] as MuscleGroup,
      name: fields[4] as String?,
      svgPath: fields[8] as Path?,
      child: fields[3] as ChildMuscle?,
    );
  }

  @override
  void write(BinaryWriter writer, Muscle obj) {
    writer
      ..writeByte(4)
      ..writeByte(2)
      ..write(obj.group)
      ..writeByte(3)
      ..write(obj.child)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(8)
      ..write(obj.svgPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MuscleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MuscleGroupAdapter extends TypeAdapter<MuscleGroup> {
  @override
  final int typeId = 1;

  @override
  MuscleGroup read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MuscleGroup.Arms;
      case 1:
        return MuscleGroup.Chest;
      case 2:
        return MuscleGroup.Legs;
      case 3:
        return MuscleGroup.Abdominals;
      case 4:
        return MuscleGroup.Glutes;
      case 5:
        return MuscleGroup.Calves;
      case 6:
        return MuscleGroup.Forearms;
      case 7:
        return MuscleGroup.Traps;
      case 8:
        return MuscleGroup.Neck;
      case 9:
        return MuscleGroup.UpperBack;
      case 10:
        return MuscleGroup.LowerBack;
      case 11:
        return MuscleGroup.HipFlexors;
      case 12:
        return MuscleGroup.Adductors;
      case 13:
        return MuscleGroup.Abductors;
      case 14:
        return MuscleGroup.PlantarFlexors;
      case 15:
        return MuscleGroup.Dorsiflexors;
      case 16:
        return MuscleGroup.Invertors;
      case 17:
        return MuscleGroup.Empty;
      default:
        return MuscleGroup.Arms;
    }
  }

  @override
  void write(BinaryWriter writer, MuscleGroup obj) {
    switch (obj) {
      case MuscleGroup.Arms:
        writer.writeByte(0);
        break;
      case MuscleGroup.Chest:
        writer.writeByte(1);
        break;
      case MuscleGroup.Legs:
        writer.writeByte(2);
        break;
      case MuscleGroup.Abdominals:
        writer.writeByte(3);
        break;
      case MuscleGroup.Glutes:
        writer.writeByte(4);
        break;
      case MuscleGroup.Calves:
        writer.writeByte(5);
        break;
      case MuscleGroup.Forearms:
        writer.writeByte(6);
        break;
      case MuscleGroup.Traps:
        writer.writeByte(7);
        break;
      case MuscleGroup.Neck:
        writer.writeByte(8);
        break;
      case MuscleGroup.UpperBack:
        writer.writeByte(9);
        break;
      case MuscleGroup.LowerBack:
        writer.writeByte(10);
        break;
      case MuscleGroup.HipFlexors:
        writer.writeByte(11);
        break;
      case MuscleGroup.Adductors:
        writer.writeByte(12);
        break;
      case MuscleGroup.Abductors:
        writer.writeByte(13);
        break;
      case MuscleGroup.PlantarFlexors:
        writer.writeByte(14);
        break;
      case MuscleGroup.Dorsiflexors:
        writer.writeByte(15);
        break;
      case MuscleGroup.Invertors:
        writer.writeByte(16);
        break;
      case MuscleGroup.Empty:
        writer.writeByte(17);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MuscleGroupAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
      child: $enumDecodeNullable(_$ChildMuscleEnumMap, json['child']),
      image: json['image'] as String?,
    );

const _$MuscleFieldMap = <String, String>{
  'id': 'id',
  'action': 'action',
  'group': 'group',
  'child': 'child',
  'image': 'image',
  'createdAt': 'created_at',
  'updatedAt': 'updated_at',
  'recovery': 'recovery',
};

Map<String, dynamic> _$MuscleToJson(Muscle instance) => <String, dynamic>{
      'id': instance.id,
      'action': instance.action,
      'group': _$MuscleGroupEnumMap[instance.group]!,
      'child': _$ChildMuscleEnumMap[instance.child],
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
