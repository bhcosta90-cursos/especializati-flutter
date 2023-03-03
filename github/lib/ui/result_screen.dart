import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:github/models/user.dart';
import 'package:http/http.dart' as http;

class ResultScreen extends StatelessWidget {
  final String username;

  const ResultScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Resultados'),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Center(
            child: FutureBuilder(
          future: _searchUser(username),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final user = snapshot.data as User;

              Column site = Column(children: []);

              if (user.blog.isNotEmpty) {
                site = Column(children: [
                  Container(height: 10),
                  Text(user.blog,
                      style: const TextStyle(fontSize: 16, color: Colors.white))
                ]);
              }

              return Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          user.avatarUrl,
                          height: 100,
                        ),
                      ),
                      Container(height: 10),
                      Text(user.name,
                          style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      site,
                      Container(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
                            decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.circular(12)),
                            child: Text("Seguidores: ${user.followers}",
                                style: const TextStyle(
                                  color: Colors.white,
                                )),
                          ),
                          Container(width: 10),
                          Container(
                            padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(12)),
                            child: Text("Repositórios: ${user.publicRepos}",
                                style: const TextStyle(
                                  color: Colors.white,
                                )),
                          ),
                        ],
                      ),
                    ],
                  ));
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            }

            return const CircularProgressIndicator(
              backgroundColor: Colors.black,
            );
          },
        )));
  }

  Future<User> _searchUser(String username) async {
    final Uri url = Uri.https('api.github.com', 'users/$username');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    }

    throw Exception('algo deu errado');
  }
}
