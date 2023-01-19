import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NewEditTodo extends StatefulWidget {
  final bool isEdit;
  const NewEditTodo({
    super.key,
    this.isEdit = false,
  });

  @override
  _NewEditTodoState createState() => _NewEditTodoState();
}

class _NewEditTodoState extends State<NewEditTodo> {
  @override
  void initState() {
    getDateTime();
    super.initState();
  }

  String getDateTime() {
    DateTime now = DateTime.now();
    var formatterDate = DateFormat.yMMMMd('en_US');
    var formatterTime = DateFormat.jm();
    String date = formatterDate.format(now).toString();
    String time = formatterTime.format(now).toString();
    print('$date + $time ');

    return "$date + $time";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEdit ? "Edit Note" : 'New Note'),
        backgroundColor: const Color(0xFF1D2A64),
      ),
      body: Container(
        color: const Color(0xFFE6EAF2),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.isEdit ? "Edit Current Note" : 'Create New Note',
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
                decoration: InputDecoration(
                  labelText: widget.isEdit ? "Edit Title" : 'New Title',
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
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                maxLines: 4,

                decoration: InputDecoration(
                  labelText: widget.isEdit ? "Edit Body" : 'New Body',
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
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {},
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
    );
  }
}
