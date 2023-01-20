import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/bloc/notes_bloc.dart';
import 'package:note_app/bloc/notes_events.dart';
import 'package:note_app/model/note_model_hive.dart';
import 'package:note_app/new_edit_screen.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  String? keyword;

  void handleClick(String value, NoteModelHive note) {
    if (value == 'Edit') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => NewEditTodo(note: note),
        ),
      );
    } else if (value == 'Delete') {
      context.read<NotesBloc>().add(DeleteNoteEvent(note: note));
    }
  }

  @override
  Widget build(BuildContext context) {
    List<NoteModelHive> notes = context.watch<NotesBloc>().state.notes;
    if (keyword != null && keyword?.isNotEmpty == true) {
      notes =
          notes.where((element) => element.header.contains(keyword!)).toList();
    }
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(26),
                    child: Text(
                      "My Notes",
                      style: GoogleFonts.lato(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1D2A64),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //TODOS Search
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                ),
                margin: const EdgeInsets.all(26.0),
                height: MediaQuery.of(context).size.height / 20,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xFFE6EAF2),
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: Stack(
                  children: [
                    TextField(
                      onChanged: (value) {
                        setState(() => keyword = value);
                      },
                      decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        hintText: "Search by title",
                        hintStyle: GoogleFonts.lato(
                          color: const Color(0xFFD2D9DF),
                          fontSize: 16.0,
                        ),
                      ),
                      style: GoogleFonts.lato(
                        color: const Color(0xFF1D2A64),
                        fontSize: 16.0,
                      ),
                    ),
                    const Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: Icon(
                        Icons.search,
                        color: Color(0xFFD2D9DF),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 15.0, right: 26.0),
                        height: MediaQuery.of(context).size.height / 11,
                        width: MediaQuery.of(context).size.height / 4,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1D2A64),
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: Center(
                          child: Text(
                            "${notes.length} Notes",
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(26.0),
                child: Text(
                  "Most Recent Notes",
                  style: GoogleFonts.lato(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1D2A64),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final NoteModelHive note = notes[index];
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: note.isChecked,
                                onChanged: (value) {
                                  context.read<NotesBloc>().add(
                                        EditNoteEvent(
                                          note: note.copyWith(
                                            isChecked: value,
                                          ),
                                        ),
                                      );
                                },
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: Column(
                                  children: [
                                    Text(
                                      note.header,
                                      style: GoogleFonts.lato(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xFF1D2A64),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      note.body,
                                      style: GoogleFonts.lato(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF1D2A64),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          PopupMenuButton<String>(
                            icon: const Icon(Icons.more_vert),
                            onSelected: (String value) =>
                                handleClick(value, note),
                            itemBuilder: (BuildContext context) {
                              return {'Edit', 'Delete'}.map((String choice) {
                                return PopupMenuItem<String>(
                                  value: choice,
                                  child: Text(choice),
                                );
                              }).toList();
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
                childCount: notes.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const NewEditTodo(),
          ),
        ),
        child: const Center(
          child: Icon(Icons.add),
        ),
        backgroundColor: const Color(0xFF1D2A64),
      ),
    );
  }
}
