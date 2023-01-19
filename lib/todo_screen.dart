import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/new_edit_screen.dart';
import 'package:note_app/search_views.dart';

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
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchPage(),
                    ),
                  );
                },
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
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Search by title",
                          style: GoogleFonts.lato(
                            color: const Color(0xFFD2D9DF),
                            fontSize: 16.0,
                          ),
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
                            "4 Notes",
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
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 7.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
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
                                    const NewEditTodo(
                                  isEdit: true,
                                ),
                              ),
                            ),
                            child: const Icon(Icons.more_vert),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                childCount: 3,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const NewEditTodo(
              isEdit: false,
            ),
          ),
        ),
        child: Center(
          child: Icon(Icons.add),
        ),
        backgroundColor: Color(0xFF1D2A64),
      ),
    );
  }
}
