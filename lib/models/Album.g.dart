// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Album.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlbumAdapter extends TypeAdapter<Album> {
  @override
  final int typeId = 0;

  @override
  Album read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Album()
      .._userId = fields[0] as num?
      .._id = fields[1] as num?
      .._title = fields[2] as String?;
  }

  @override
  void write(BinaryWriter writer, Album obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj._userId)
      ..writeByte(1)
      ..write(obj._id)
      ..writeByte(2)
      ..write(obj._title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlbumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
