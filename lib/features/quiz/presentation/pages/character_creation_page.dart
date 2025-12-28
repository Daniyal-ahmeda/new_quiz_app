import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/widgets/common_button.dart';
import '../../data/models/character_model.dart';
import '../providers/character_provider.dart';
import '../widgets/character_creation/archetype_section.dart';
import '../widgets/character_creation/attributes_section.dart';
import '../widgets/character_creation/identity_section.dart';

class CharacterCreationPage extends ConsumerStatefulWidget {
  const CharacterCreationPage({super.key});

  @override
  ConsumerState<CharacterCreationPage> createState() =>
      _CharacterCreationPageState();
}

class _CharacterCreationPageState extends ConsumerState<CharacterCreationPage> {
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  int _intelligence = 50;
  int _creativity = 50;
  int _focus = 50;
  String _selectedArchetype = 'Scholar';

  final Map<String, Map<String, dynamic>> _archetypes = {
    'Scholar': {
      'icon': Icons.menu_book,
      'color': Colors.blue,
      'description': 'Master of knowledge.',
      'stats': {'Intelligence': 80, 'Creativity': 40, 'Focus': 90},
    },
    'Innovator': {
      'icon': Icons.lightbulb,
      'color': Colors.amber,
      'description': 'Thinks outside the box.',
      'stats': {'Intelligence': 70, 'Creativity': 90, 'Focus': 60},
    },
    'Visionary': {
      'icon': Icons.visibility,
      'color': Colors.purple,
      'description': 'Sees the future.',
      'stats': {'Intelligence': 60, 'Creativity': 80, 'Focus': 70},
    },
  };

  void _selectArchetype(String name) {
    setState(() {
      _selectedArchetype = name;
      final stats = _archetypes[name]!['stats'] as Map<String, int>;
      _intelligence = stats['Intelligence']!;
      _creativity = stats['Creativity']!;
      _focus = stats['Focus']!;
    });
  }

  void _createCharacter() {
    if (_nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please name your character')),
      );
      return;
    }
    final newChar = CharacterModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: _nameController.text,
      description: _descController.text.isEmpty
          ? _archetypes[_selectedArchetype]!['description']
          : _descController.text,
      imageUrl:
          'https://ui-avatars.com/api/?name=${_nameController.text}&background=random',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      stats: {
        'Intelligence': _intelligence,
        'Creativity': _creativity,
        'Focus': _focus,
      },
    );
    ref
        .read(characterRepositoryProvider)
        .addCharacter(newChar)
        .then((_) => Navigator.of(context).pop());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Character')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            IdentitySection(
              nameController: _nameController,
              descController: _descController,
            ),
            const SizedBox(height: 24),
            ArchetypeSection(
              selectedArchetype: _selectedArchetype,
              archetypes: _archetypes,
              onSelect: _selectArchetype,
            ),
            const SizedBox(height: 24),
            AttributesSection(
              intelligence: _intelligence,
              creativity: _creativity,
              focus: _focus,
              onIntelligenceChanged: (v) =>
                  setState(() => _intelligence = v.toInt()),
              onCreativityChanged: (v) =>
                  setState(() => _creativity = v.toInt()),
              onFocusChanged: (v) => setState(() => _focus = v.toInt()),
              onReset: () => _selectArchetype(_selectedArchetype),
            ),
            const SizedBox(height: 32),
            CommonButton(
              label: 'Create Character',
              onPressed: _createCharacter,
            ),
          ],
        ),
      ),
    );
  }
}
