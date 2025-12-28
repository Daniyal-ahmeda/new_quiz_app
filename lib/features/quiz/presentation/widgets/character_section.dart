import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/custom_card.dart';
import '../pages/character_list_page.dart';

class CharacterSection extends StatelessWidget {
  const CharacterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Characters',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const CharacterListPage(),
                    ),
                  ),
                  child: const Text('View All'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomCard(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const CharacterListPage()),
              ),
              child: Container(
                height: 100,
                alignment: Alignment.center,
                child: const ListTile(
                  leading: CircleAvatar(
                    backgroundColor: AppColors.secondary,
                    child: Icon(Icons.people, color: Colors.white),
                  ),
                  title: Text('Manage Characters'),
                  subtitle: Text('Create and edit your custom characters'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),
              ),
            ),
          ),
          const SizedBox(height: 50), // Bottom spacer
        ],
      ),
    );
  }
}
