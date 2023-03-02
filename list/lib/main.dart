import "package:flutter/material.dart";

void main() => runApp(new ListApp());

class ListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> items = [
      'task 1',
      'task 2',
      'task 3',
      'task 4',
      'task 5',
      'task 6',
      'task 7',
      'task 8',
      'task 9',
      'task 10',
      'task 11',
      'task 12',
    ];

    return MaterialApp(
        title: 'List App',
        home: Scaffold(
            appBar: AppBar(
              title: Text("List App"),
              backgroundColor: Colors.deepPurple,
              centerTitle: true,
            ),
            body: ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                color: Colors.deepPurple,
                height: 12.2,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.deepPurple,
                    child: IconTheme(
                        data: IconThemeData(color: Colors.white),
                        child: Icon(Icons.add_photo_alternate)),
                  ),
                  onTap: () {},
                  title: Text(items[index],
                      style: const TextStyle(color: Colors.deepPurple)),
                  subtitle: Text("Sub ${index + 1} teste",
                      style: const TextStyle(color: Colors.deepPurple)),
                );
              },
            )));
  }
}
