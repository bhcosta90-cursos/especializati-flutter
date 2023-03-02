import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My App',
        home: Scaffold(
            appBar: AppBar(
              title: Text("Widget App"),
              centerTitle: true,
              backgroundColor: Colors.deepPurple,
            ),
            body: const Padding(
              padding: EdgeInsets.all(12),
              child: Text('Widget App'),
            )));
  }
}
