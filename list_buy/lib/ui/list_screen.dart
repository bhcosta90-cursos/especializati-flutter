import 'package:flutter/material.dart';
import 'package:list_buy/models/item.dart';
import 'package:list_buy/ui/add_item.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Item> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Dynamic App"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: _addItem,
        child: const Icon(Icons.add),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView.separated(
            itemBuilder: (context, index) {
              final item = items[index];

              return ListTile(
                onTap: () => setState(() {
                  items[index].isDone = !items[index].isDone;
                }),
                leading: CircleAvatar(
                  backgroundColor: item.isDone ? Colors.green : Colors.blueGrey,
                  child: IconTheme(
                      data: const IconThemeData(color: Colors.white),
                      child: Icon(item.isDone ? Icons.done_all : Icons.done)),
                ),
                title: Text(item.title,
                    style: const TextStyle(color: Colors.blueGrey)),
              );
            },
            separatorBuilder: (context, index) =>
                const Divider(color: Colors.blueGrey),
            itemCount: items.length),
      ),
    );
  }

  void _addItem() async {
    final item = await showDialog<Item>(
        context: context,
        builder: (BuildContext context) {
          return AddItem();
        });

    setState(() {
      items.add(item!);
    });
  }

  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      items.sort((a, b) {
        if (a.isDone && !b.isDone) {
          return 1;
        } else if (!a.isDone && b.isDone) {
          return -1;
        }

        return 0;
      });
    });

    return Future.value();
  }
}
