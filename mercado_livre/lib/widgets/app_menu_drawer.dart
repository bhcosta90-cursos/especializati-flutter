import 'package:flutter/material.dart';
import 'package:mercado_livre/pages/page01.dart';
import 'package:mercado_livre/pages/page02.dart';

class AppMenuDrawer extends StatelessWidget {
  const AppMenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
            height: 120,
            child: DrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromRGBO(255, 241, 89, 1)),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 4.0),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: const CircleAvatar(
                        backgroundColor: Color.fromRGBO(255, 241, 89, 1),
                        foregroundColor: Colors.grey,
                        child: Icon(Icons.people),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Olá, Bruno",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            Text("Nivel avançado")
                          ],
                        ))
                  ],
                ))),
        _itemDrawer(context, new Page01(),
            icon: const Icon(Icons.home), text: "Home"),
        _itemDrawer(context, new Page02(),
            icon: const Icon(Icons.hotel), text: "Pagina 2"),
        const Divider(color: Colors.grey),
        _itemDrawer(context, new Page01(),
            icon: const Icon(Icons.label_important), text: "Pagina 3"),
        _itemDrawer(context, new Page01(),
            icon: const Icon(Icons.location_searching),
            text: "Pagina 4",
            badge: "5"),
        _itemDrawer(context, new Page01(),
            icon: const Icon(Icons.filter_8), text: "Pagina 5"),
        _itemDrawer(context, new Page01(),
            icon: const Icon(Icons.face), text: "Pagina 6"),
        const Divider(color: Colors.grey),
        _itemDrawer(context, new Page01(),
            icon: const Icon(Icons.exit_to_app), text: "Sair"),
      ],
    );
  }

  Widget _itemDrawer(context, page,
      {required Icon icon, required String text, String badge = ''}) {
    return ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      title: Text(
        text,
        style: const TextStyle(color: Colors.black),
      ),
      leading: IconTheme(
          data: const IconThemeData(color: Colors.black), child: icon),
      trailing: badge.isEmpty
          ? Text('')
          : Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(100)),
              child: Padding(
                  padding: EdgeInsets.fromLTRB(6, 2, 6, 2),
                  child: Text(badge, style: TextStyle(color: Colors.white)))),
    );
  }
}
