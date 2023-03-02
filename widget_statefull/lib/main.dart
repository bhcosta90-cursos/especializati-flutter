import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  int totalClicks = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My App',
        home: Scaffold(
          appBar: AppBar(
              title: const Text('My App'),
              centerTitle: true,
              backgroundColor: Colors.greenAccent),
          body: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Total de cliques: $totalClicks'),
              ElevatedButton(
                  onPressed: () => _increment(),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent),
                  child: const Text('Clique'))
            ],
          )),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _increment(),
            backgroundColor: Colors.greenAccent,
            child: const Icon(Icons.add),
          ),
        ));
  }

  void _increment() {
    setState(() => {totalClicks++});
  }
}
