// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favs_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavsModelAdapter extends TypeAdapter<FavsModel> {
  @override
  final int typeId = 0;

  @override
  FavsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavsModel(
      title: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, FavsModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
