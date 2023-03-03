import 'package:flutter/material.dart';
import 'package:github/ui/result_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  TextEditingController _username = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
              // color: Colors.black,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(120.0),
                  )),
              // height: 300.0,
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Image.asset(
                  'assets/images/github.png',
                  height: 120.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Column(
                children: [
                  TextField(
                    controller: _username,
                    decoration: const InputDecoration(
                      hintText: 'username',
                      labelText: 'username',
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1)),
                    ),
                  ),
                  Container(height: 10),
                  SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResultScreen(
                                      username: _username.value.text))),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Buscar',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )))
                ],
              ),
            ),
          ],
        ));
  }
}
