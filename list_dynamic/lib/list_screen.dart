import "dart:math";

import "package:flutter/material.dart";

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<String> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List Dynamic App"),
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.deepPurple,
                  child: IconTheme(
                      data: IconThemeData(color: Colors.white),
                      child: Icon(Icons.ac_unit)),
                ),
                onTap: () {},
                title: Text(items[index],
                    style: const TextStyle(color: Colors.deepPurple)),
                subtitle: Text("Sub ${index + 1} teste",
                    style: const TextStyle(color: Colors.deepPurple)),
              );
            },
            separatorBuilder: (context, index) =>
                Divider(color: Colors.deepPurple),
            itemCount: items.length),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          child: Icon(Icons.add),
          onPressed: () => _addTodo(),
        ));
  }

  void _addTodo() {
    setState(() {
      int random = Random().nextInt(100);
      items.add('Task $random');
    });
    ;
  }
}
