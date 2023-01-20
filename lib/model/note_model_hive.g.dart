// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_model_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NoteModelHiveAdapter extends TypeAdapter<NoteModelHive> {
  @override
  final int typeId = 0;

  @override
  NoteModelHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NoteModelHive(
      id: fields[0] as String,
      lastUpdated: fields[1] as String,
      isChecked: fields[2] as bool,
      body: fields[4] as String,
      header: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NoteModelHive obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.lastUpdated)
      ..writeByte(2)
      ..write(obj.isChecked)
      ..writeByte(3)
      ..write(obj.header)
      ..writeByte(4)
      ..write(obj.body);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteModelHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteModelHive _$NoteModelHiveFromJson(Map<String, dynamic> json) =>
    NoteModelHive(
      id: json['id'] as String,
      lastUpdated: json['last_updated'] as String,
      isChecked: json['is_checked'] as bool,
      body: json['body'] as String,
      header: json['header'] as String,
    );

Map<String, dynamic> _$NoteModelHiveToJson(NoteModelHive instance) =>
    <String, dynamic>{
      'id': instance.id,
      'last_updated': instance.lastUpdated,
      'is_checked': instance.isChecked,
      'header': instance.header,
      'body': instance.body,
    };
