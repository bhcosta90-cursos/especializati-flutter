import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Text text = const Text("Texto");
    TextField textField = const TextField();

    return MaterialApp(
        title: 'My App',
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Widget App"),
              centerTitle: true,
              backgroundColor: Colors.deepPurple,
            ),
            body: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  text,
                  textField,
                  Row(
                    children: const [Text("Text 01"), Text("Text 02")],
                  ),
                  const Text(
                    "Widget App",
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                  ElevatedButton(
                      onPressed: () => {}, child: const Text("Widget App"))
                ],
              ),
            )));
  }
}
