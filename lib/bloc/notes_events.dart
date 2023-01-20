import 'package:note_app/model/note_model_hive.dart';

abstract class NotesEvent {}

class LoadNotesEvent extends NotesEvent {
  LoadNotesEvent();
}

class AddNoteEvent extends NotesEvent {
  final NoteModelHive note;

  AddNoteEvent({
    required this.note,
  });
}

class EditNoteEvent extends NotesEvent {
  final NoteModelHive note;

  EditNoteEvent({
    required this.note,
  });
}

class DeleteNoteEvent extends NotesEvent {
  final NoteModelHive note;

  DeleteNoteEvent({
    required this.note,
  });
}
