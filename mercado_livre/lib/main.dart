import 'package:flutter/material.dart';
import 'package:mercado_livre/pages/cart.dart';
import 'package:mercado_livre/pages/home.dart';
import 'package:mercado_livre/widgets/app_bar_search.dart';
import 'package:mercado_livre/widgets/app_menu_drawer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'App ML Clone',
      home: HomeMyApp(),
    );
  }
}

class HomeMyApp extends StatefulWidget {
  const HomeMyApp({super.key});

  @override
  State<HomeMyApp> createState() => _HomeMyAppState();
}

class _HomeMyAppState extends State<HomeMyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(child: AppMenuDrawer()),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text('Mercado Livre',
              style: TextStyle(color: Colors.black)),
          backgroundColor: const Color.fromRGBO(255, 241, 89, 1),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => new Cart())),
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () =>
                  showSearch(context: context, delegate: AppSearchBar()),
            )
          ],
        ),
        body: const Home());
  }
}
