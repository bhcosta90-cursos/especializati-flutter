import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String result = "";
  double number1 = 0.0;
  double number2 = 0.0;

  @override
  Widget build(BuildContext context) {
    TextField num1 = TextField(
      keyboardType: TextInputType.number,
      style: const TextStyle(color: Colors.deepOrange),
      onChanged: (value) {
        number1 = value.isNotEmpty ? double.parse(value) : 0;
      },
      decoration: const InputDecoration(
          labelText: 'Número 01',
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepOrange, width: 2.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepOrange, width: 2.0)),
          labelStyle: TextStyle(color: Colors.deepOrange)),
    );

    TextField num2 = TextField(
      keyboardType: TextInputType.number,
      style: const TextStyle(color: Colors.deepOrange),
      onChanged: (value) {
        number2 = value.isNotEmpty ? double.parse(value) : 0;
      },
      decoration: const InputDecoration(
          labelText: 'Número 02',
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepOrange, width: 2.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepOrange, width: 2.0)),
          labelStyle: TextStyle(color: Colors.deepOrange)),
    );

    ElevatedButton button = ElevatedButton(
        onPressed: () {
          double calc = number1 + number2;
          setState(() {
            this.result = "Resultado da soma é: ${calc.toStringAsFixed(2)}";
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepOrange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'Calcular',
          style: TextStyle(color: Colors.white),
        ));

    Padding separator = const Padding(
      padding: EdgeInsets.all(4.0),
    );

    Text result =
        Text(this.result, style: const TextStyle(color: Colors.deepOrange));

    Padding template = Padding(
      padding: const EdgeInsets.all(14),
      child: Column(
        children: [
          num1,
          separator,
          num2,
          separator,
          SizedBox(
            width: double.infinity,
            child: button,
          ),
          separator,
          result
        ],
      ),
    );

    return MaterialApp(
        title: 'Calculadora',
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Calculadora"),
            centerTitle: true,
            backgroundColor: Colors.deepOrange,
          ),
          body: template,
        ));
  }
}
