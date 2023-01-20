import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/model/note_model_hive.dart';

class HiveManager {
  static HiveManager? _instance;

  factory HiveManager() {
    _instance ??= HiveManager._init();
    return _instance!;
  }

  HiveManager._init();

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(NoteModelHiveAdapter());
  }

  Future<List<NoteModelHive>> saveNotes(
    List<NoteModelHive> notes,
  ) async {
    try {
      final Box<NoteModelHive> box = await Hive.openBox("NoteModelHive");
      await box.clear();
      await box.addAll(notes);
      return box.values.toList();
    } catch (e) {
      debugPrint("$e");
      return [];
    }
  }

  Future<List<NoteModelHive>> getNotes() async {
    try {
      final Box<NoteModelHive> box = await Hive.openBox("NoteModelHive");
      return box.values.toList();
    } catch (e) {
      debugPrint("$e");
      return [];
    }
  }

  Future<List<NoteModelHive>> editNote(NoteModelHive note) async {
    try {
      final Box<NoteModelHive> box = await Hive.openBox("NoteModelHive");
      final List<NoteModelHive> notes = List.from(box.values.toList());
      final int index = notes.indexWhere((element) => element.id == note.id);
      if (index >= 0) {
        notes[index] = note;
      }
      await box.clear();
      await box.addAll(notes);
      return box.values.toList();
    } catch (e) {
      debugPrint("$e");
      return [];
    }
  }

  Future<List<NoteModelHive>> deleteNote(NoteModelHive note) async {
    try {
      final Box<NoteModelHive> box = await Hive.openBox("NoteModelHive");
      final List<NoteModelHive> notes = List.from(box.values.toList());
      final int index = notes.indexWhere((element) => element.id == note.id);
      if (index < 0) return notes;
      notes.removeAt(index);
      await box.clear();
      await box.addAll(notes);
      return box.values.toList();
    } catch (e) {
      debugPrint("$e");
      return [];
    }
  }
}
