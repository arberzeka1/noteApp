import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'note_model_hive.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class NoteModelHive extends HiveObject {
  @HiveField(0)
  @JsonKey(name: "id")
  String id;

  @HiveField(1)
  @JsonKey(name: "last_updated")
  int lastUpdated;

  @HiveField(2)
  @JsonKey(name: "is_checked")
  bool isChecked;

  @HiveField(3)
  @JsonKey(name: "header")
  String header;

  @HiveField(4)
  @JsonKey(name: "body")
  String body;

  NoteModelHive({
    required this.id,
    required this.lastUpdated,
    required this.isChecked,
    required this.body,
    required this.header,
  });

  factory NoteModelHive.fromJson(Map<String, dynamic> json) =>
      _$NoteModelHiveFromJson(json);

  Map<String, dynamic> toJson() => _$NoteModelHiveToJson(this);

  NoteModelHive copyWith({
    bool? isChecked,
  }) {
    return NoteModelHive(
      id: id,
      lastUpdated: lastUpdated,
      isChecked: isChecked ?? this.isChecked,
      body: body,
      header: header,
    );
  }
}
