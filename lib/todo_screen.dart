import 'package:flutter/material.dart';
import 'package:note_app/new_edit_screen.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  bool onCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        actions: const [
          Icon(
            Icons.search,
          ),
        ],
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        color: Colors.blueGrey.shade100,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                    separatorBuilder: (
                      _,
                      __,
                    ) =>
                        const SizedBox(
                          height: 20,
                        ),
                    scrollDirection: Axis.vertical,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        height: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: onCheck,
                                  onChanged: (value) {
                                    setState(() {
                                      onCheck = !onCheck;
                                    });
                                  },
                                ),
                                const Text('todo TEXT'),
                              ],
                            ),
                            GestureDetector(
                                onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const NewEditTodo(),
                                      ),
                                    ),
                                child: const Icon(Icons.more_vert)),
                          ],
                        ),
                      );

                      ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        selectedTileColor: Colors.orange[100],
                        selected: onCheck,
                        title: Text('Title'),
                        trailing: Icon(Icons.more_vert),
                        leading: Checkbox(
                          value: onCheck,
                          onChanged: (value) {
                            setState(() {
                              onCheck = !onCheck;
                            });
                          },
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
