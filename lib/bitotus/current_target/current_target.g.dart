// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_target.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrentTargetAdapter extends TypeAdapter<CurrentTarget> {
  @override
  final int typeId = 5;

  @override
  CurrentTarget read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrentTarget(
      id: fields[0] as String,
      startTime: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, CurrentTarget obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.startTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrentTargetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentTarget _$CurrentTargetFromJson(Map<String, dynamic> json) =>
    CurrentTarget(
      id: json['id'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
    );

Map<String, dynamic> _$CurrentTargetToJson(CurrentTarget instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startTime': instance.startTime.toIso8601String(),
    };
