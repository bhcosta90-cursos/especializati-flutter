import 'package:flutter/material.dart';

class AppSearchBar extends SearchDelegate<String> {
  final products = [
    'TV',
    'Macbook',
    'Geladeira',
    'Iphone',
    'Teclado',
    'Ipad',
    'Mouse',
    'Copo',
  ];

  final recentSearch = [
    'Macbook',
    'Iphone',
    'Ipad',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
            close(context, "");
          },
          icon: Icon(Icons.cancel))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          query = "";
          close(context, "");
        },
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("Resultado para a pesquisa: $query");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final results = query.isEmpty ? recentSearch : products;

    return ListView.builder(
        itemBuilder: (context, index) => ListTile(
              title: Text(results[index]),
              onTap: () => print(results[index]),
              leading: const Icon(Icons.youtube_searched_for),
            ),
        itemCount: results.length);
  }
}
