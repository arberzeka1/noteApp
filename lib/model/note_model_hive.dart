import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
part 'note_model_hive.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class NoteModelHive extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? lastUpdated;
  @HiveField(2)
  bool? isChecked;
  @HiveField(3)
  String? headerNote;
  @HiveField(4)
  String? bodyNote;

  NoteModelHive({
    required this.id,
    required this.lastUpdated,
    this.isChecked,
    this.bodyNote,
    this.headerNote,
  });
  factory NoteModelHive.fromJson(Map<String, dynamic> json) =>
      _$NoteModelHiveFromJson(json);

  Map<String, dynamic> toJson() => _$NoteModelHiveToJson(this);
}
