import 'package:flutter/material.dart';

class Page02 extends StatelessWidget {
  const Page02({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Page 02', style: TextStyle(color: Colors.black)),
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: const Color.fromRGBO(255, 241, 89, 1),
        ),
        body: Center(child: Text("Pagina 02")));
  }
}
