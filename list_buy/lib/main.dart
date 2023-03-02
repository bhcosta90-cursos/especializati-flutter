import 'package:flutter/material.dart';
import 'package:list_buy/ui/list_screen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lista de compras",
      home: ListScreen(),
    );
  }
}
