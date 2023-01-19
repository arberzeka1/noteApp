// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_model_hive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteModelHive _$NoteModelHiveFromJson(Map<String, dynamic> json) =>
    NoteModelHive(
      id: json['id'] as String?,
      lastUpdated: json['lastUpdated'] as String?,
      isChecked: json['isChecked'] as bool?,
      bodyNote: json['bodyNote'] as String?,
      headerNote: json['headerNote'] as String?,
    );

Map<String, dynamic> _$NoteModelHiveToJson(NoteModelHive instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lastUpdated': instance.lastUpdated,
      'isChecked': instance.isChecked,
      'headerNote': instance.headerNote,
      'bodyNote': instance.bodyNote,
    };
