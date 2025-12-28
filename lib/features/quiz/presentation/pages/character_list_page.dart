import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../core/widgets/character_avatar.dart';
import '../../../../core/widgets/custom_card.dart';
import '../../domain/entities/character.dart';
import '../providers/character_provider.dart';
import '../../../../features/auth/presentation/providers/auth_provider.dart';
import 'character_search_delegate.dart';
import '../../../profile/presentation/pages/profile_page.dart';

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
        title: const Text('Characters'),
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
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const ProfilePage()));
            },
          ),
        ],
      ),
      body: charactersAsync.when(
        data: (characters) => ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: characters.length,
          itemBuilder: (context, index) {
            final char = characters[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: CustomCard(
                child: ListTile(
                  leading: CharacterAvatar(imageUrl: char.imageUrl),
                  title: Text(char.name),
                  subtitle: Text(char.description),
                  trailing: IconButton(
                    icon: const Icon(Icons.share),
                    onPressed: () => _shareCharacter(char),
                  ),
                ),
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, stack) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, // TODO: Add Create Dialog
        child: const Icon(Icons.add),
      ),
    );
  }
}
