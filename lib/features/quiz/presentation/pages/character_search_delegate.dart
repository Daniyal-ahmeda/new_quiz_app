import 'package:flutter/material.dart';
import '../../domain/entities/character.dart';

class CharacterSearchDelegate extends SearchDelegate<Character?> {
  final List<Character> characters;

  CharacterSearchDelegate(this.characters);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(icon: const Icon(Icons.clear), onPressed: () => query = ''),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildList(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildList(context);
  }

  Widget _buildList(BuildContext context) {
    final results = characters.where((char) {
      return char.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    if (results.isEmpty) {
      return const Center(child: Text('No characters found via search.'));
    }

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final char = results[index];
        return ListTile(
          title: Text(char.name),
          subtitle: Text(char.description),
          onTap: () => close(context, char),
        );
      },
    );
  }
}
