// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'target.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TargetAdapter extends TypeAdapter<Target> {
  @override
  final int typeId = 3;

  @override
  Target read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Target(
      id: fields[0] as String,
      name: fields[1] as String,
      caption: fields[2] as String,
      state: fields[3] as String,
      dives: (fields[4] as List).cast<Dive>(),
    );
  }

  @override
  void write(BinaryWriter writer, Target obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.caption)
      ..writeByte(3)
      ..write(obj.state)
      ..writeByte(4)
      ..write(obj.dives);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TargetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Target _$TargetFromJson(Map<String, dynamic> json) => Target(
      id: json['id'] as String,
      name: json['name'] as String,
      caption: json['caption'] as String,
      state: json['state'] as String,
      dives: (json['dives'] as List<dynamic>)
          .map((e) => Dive.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TargetToJson(Target instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'caption': instance.caption,
      'state': instance.state,
      'dives': instance.dives.map((e) => e.toJson()).toList(),
    };
