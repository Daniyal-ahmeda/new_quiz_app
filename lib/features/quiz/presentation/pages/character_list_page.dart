import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_quiz_app/features/quiz/presentation/pages/character_details_page.dart';
import 'package:share_plus/share_plus.dart';
import '../providers/character_provider.dart';
import '../../domain/entities/character.dart';
import 'character_creation_page.dart';
import 'character_search_delegate.dart';
import '../widgets/character_list/character_grid_card.dart';

class CharacterListPage extends ConsumerWidget {
  const CharacterListPage({super.key});

  void _shareCharacter(Character character) {
    Share.share('Check out ${character.name}: ${character.description}');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final charactersAsync = ref.watch(characterListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Characters'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              charactersAsync.whenData((characters) {
                showSearch(
                  context: context,
                  delegate: CharacterSearchDelegate(characters),
                );
              });
            },
          ),
        ],
      ),
      body: charactersAsync.when(
        data: (characters) {
          if (characters.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_off_outlined,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No characters yet',
                    style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 8),
                  const Text('Create one to get started!'),
                ],
              ),
            );
          }
          return GridView.builder(
            padding: const EdgeInsets.fromLTRB(
              16,
              16,
              16,
              100,
            ), // Increased bottom padding
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: characters.length,
            itemBuilder: (context, index) {
              final char = characters[index];
              return CharacterGridCard(
                character: char,
                onShare: () => _shareCharacter(char),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => CharacterDetailsPage(character: char),
                    ),
                  );
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, stack) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 70.0), // Lift above navbar
        child: FloatingActionButton.extended(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const CharacterCreationPage()),
            );
          },
          icon: const Icon(Icons.add),
          label: const Text('New'),
        ),
      ),
    );
  }
}
