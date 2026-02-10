// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecentItemAdapter extends TypeAdapter<RecentItem> {
  @override
  final int typeId = 1;

  @override
  RecentItem read(BinaryReader reader) {
    reader.readByte();
    return RecentItem(path: '', title: '', lastAccessedMs: 0);
  }

  @override
  void write(BinaryWriter writer, RecentItem obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecentItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RecentTypeAdapter extends TypeAdapter<RecentType> {
  @override
  final int typeId = 2;

  @override
  RecentType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return RecentType.track;
      case 1:
        return RecentType.folder;
      default:
        return RecentType.track;
    }
  }

  @override
  void write(BinaryWriter writer, RecentType obj) {
    switch (obj) {
      case RecentType.track:
        writer.writeByte(0);
        break;
      case RecentType.folder:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecentTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
