// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DiveAdapter extends TypeAdapter<Dive> {
  @override
  final int typeId = 4;

  @override
  Dive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Dive(
      begin: fields[0] as DateTime,
      end: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Dive obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.begin)
      ..writeByte(1)
      ..write(obj.end);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
