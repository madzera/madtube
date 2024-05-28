import 'package:flutter/material.dart';

class CustomSearch extends SearchDelegate<String> {

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          close(context, "");
        },
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = ["Age of Empires", "Chess", "Pokerstars", "League of Legends"];

    //TODO
    if (query.isNotEmpty) {
      suggestions = suggestions.where(
              (element) => element.toLowerCase().startsWith(query.toLowerCase())).toList();

      return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(suggestions[index]),
            onTap: () {
              close(context, suggestions[index]);
            },
          );
        },
      );
    } else {
      return const Center(
        child: Text("No result available"),
      );
    }

  }

}