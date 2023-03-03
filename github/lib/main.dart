import 'package:flutter/material.dart';
import 'package:github/ui/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "GitHub", home: HomeScreen(), debugShowCheckedModeBanner: false);
  }
}
