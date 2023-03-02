import 'package:flutter/material.dart';
import 'package:list_buy/models/item.dart';

class AddItem extends StatelessWidget {
  final itemC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Adicionar item"),
      content: TextField(
        autofocus: true,
        controller: itemC,
      ),
      actions: [
        MaterialButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text("Cancelar"),
        ),
        MaterialButton(
          onPressed: () {
            final item = new Item(title: itemC.value.text);
            itemC.clear();
            Navigator.of(context).pop(item);
          },
          child: Text("Add"),
        ),
      ],
    );
  }
}
