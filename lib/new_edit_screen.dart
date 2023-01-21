import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:note_app/bloc/notes_bloc.dart';
import 'package:note_app/bloc/notes_events.dart';
import 'package:note_app/model/note_model_hive.dart';
import 'package:uuid/uuid.dart';

class NewEditTodo extends StatefulWidget {
  final NoteModelHive? note;

  const NewEditTodo({
    super.key,
    this.note,
  });

  @override
  State<NewEditTodo> createState() => _NewEditTodoState();
}

class _NewEditTodoState extends State<NewEditTodo> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _titleController.text = widget.note?.header ?? "";
    _bodyController.text = widget.note?.body ?? "";
    super.initState();
  }

  String getDateTime() {
    DateTime now = DateTime.now();
    var formatterDate = DateFormat.yMMMMd('en_US');
    var formatterTime = DateFormat.jm();
    String date = formatterDate.format(now).toString();
    String time = formatterTime.format(now).toString();
    return "$date - $time";
  }

  void _onSave() {
    if (_formKey.currentState!.validate()) {
      final NoteModelHive note = NoteModelHive(
        id: widget.note?.id ?? const Uuid().v4(),
        lastUpdated: getDateTime(),
        isChecked: widget.note?.isChecked ?? false,
        body: _bodyController.text,
        header: _titleController.text,
      );
      if (widget.note == null) {
        context.read<NotesBloc>().add(AddNoteEvent(note: note));
      } else {
        context.read<NotesBloc>().add(EditNoteEvent(note: note));
      }
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note != null ? "Edit Note" : 'New Note'),
        backgroundColor: const Color(0xFF1D2A64),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          color: const Color(0xFFE6EAF2),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.note != null ? "Edit Current Note" : 'Create New Note',
                  style: GoogleFonts.lato(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1D2A64),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: widget.note != null ? "Edit Title" : 'New Title',
                    labelStyle: const TextStyle(
                      color: Color(
                        0xFF1D2A64,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: Color(0xFF1D2A64),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: Color(0xFF1D2A64),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter title';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  maxLines: 4,
                  controller: _bodyController,
                  decoration: InputDecoration(
                    labelText: widget.note != null ? "Edit Body" : 'New Body',
                    labelStyle: const TextStyle(
                      color: Color(
                        0xFF1D2A64,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: Color(0xFF1D2A64),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: Color(0xFF1D2A64),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter body';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: GestureDetector(
                    onTap: _onSave,
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1D2A64),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          'Save Note',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
