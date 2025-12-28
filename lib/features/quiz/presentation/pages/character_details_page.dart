import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/common_button.dart';
import '../../domain/entities/character.dart';
import '../widgets/attribute_slider.dart';

class CharacterDetailsPage extends StatelessWidget {
  final Character character;

  const CharacterDetailsPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(character.name),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    character.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Container(color: Colors.grey),
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black54],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'About',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    character.description,
                    style: TextStyle(color: Colors.grey[600], fontSize: 16),
                  ),
                  const SizedBox(height: 32),

                  const Text(
                    'Attributes',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  IgnorePointer(
                    child: Column(
                      children: [
                        AttributeSlider(
                          label: 'Intelligence',
                          value: (character.stats['Intelligence'] ?? 0).toInt(),
                          color: Colors.blue,
                          onChanged: (_) {},
                        ),
                        AttributeSlider(
                          label: 'Creativity',
                          value: (character.stats['Creativity'] ?? 0).toInt(),
                          color: Colors.amber,
                          onChanged: (_) {},
                        ),
                        AttributeSlider(
                          label: 'Focus',
                          value: (character.stats['Focus'] ?? 0).toInt(),
                          color: Colors.purple,
                          onChanged: (_) {},
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),
                  CommonButton(
                    label: 'Select as Active Character',
                    icon: Icons.check_circle_outline,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${character.name} is now active!'),
                        ),
                      );
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
