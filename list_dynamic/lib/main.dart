import "package:flutter/material.dart";
import "package:list_dynamic/list_screen.dart";

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List App',
      home: ListScreen(),
    );
  }
}
