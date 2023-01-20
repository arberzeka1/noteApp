import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/bloc/notes_events.dart';
import 'package:note_app/bloc/notes_state.dart';
import 'package:note_app/db/hive_manager.dart';
import 'package:note_app/model/note_model_hive.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc() : super(NotesState(notes: [])) {
    on<LoadNotesEvent>(_onLoadNotes);
    on<AddNoteEvent>(_onAddNote);
    on<EditNoteEvent>(_onEditNote);
    on<DeleteNoteEvent>(_onDeleteNote);
    add(LoadNotesEvent());
  }

  Future<void> _onLoadNotes(
    LoadNotesEvent event,
    Emitter<NotesState> emitter,
  ) async {
    final List<NoteModelHive> notes = await HiveManager().getNotes();
    emitter(NotesState(notes: notes));
  }

  Future<void> _onAddNote(
    AddNoteEvent event,
    Emitter<NotesState> emitter,
  ) async {
    List<NoteModelHive> notes = List.from(state.notes);
    notes.add(event.note);
    notes = await HiveManager().saveNotes(notes);
    emitter(NotesState(notes: notes));
  }

  Future<void> _onEditNote(
    EditNoteEvent event,
    Emitter<NotesState> emitter,
  ) async {
    final List<NoteModelHive> notes = await HiveManager().editNote(event.note);
    emitter(NotesState(notes: notes));
  }

  Future<void> _onDeleteNote(
    DeleteNoteEvent event,
    Emitter<NotesState> emitter,
  ) async {
    final List<NoteModelHive> notes =
        await HiveManager().deleteNote(event.note);
    emitter(NotesState(notes: notes));
  }
}
