import 'package:flutter/material.dart';

class NewEditTodo extends StatefulWidget {
  const NewEditTodo({Key? key}) : super(key: key);

  @override
  _NewEditTodoState createState() => _NewEditTodoState();
}

class _NewEditTodoState extends State<NewEditTodo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Note'),),

      body: Container(
        color: Colors.blueGrey.shade100,

        child: Column(children: [
          Text('Create new note'),
TextFormField(decoration: InputDecoration(hintText: "New Note")),
        ],),
      ),
    );
  }
}
