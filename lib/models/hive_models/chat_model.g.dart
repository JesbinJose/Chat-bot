// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChatsModelAdapter extends TypeAdapter<ChatsModel> {
  @override
  final int typeId = 1;

  @override
  ChatsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChatsModel(
      (fields[2] as List).cast<Chat>(),
      fields[3] as DateTime,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ChatsModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.chats)
      ..writeByte(3)
      ..write(obj.lastChat);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
