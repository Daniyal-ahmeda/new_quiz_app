import 'package:flutter/material.dart';
import '../archetype_card.dart';

class ArchetypeSection extends StatelessWidget {
  final String selectedArchetype;
  final Map<String, Map<String, dynamic>> archetypes;
  final ValueChanged<String> onSelect;

  const ArchetypeSection({
    super.key,
    required this.selectedArchetype,
    required this.archetypes,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Choose Archetype',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 160,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: archetypes.entries.map((entry) {
              return ArchetypeCard(
                name: entry.key,
                description: entry.value['description'],
                icon: entry.value['icon'],
                color: entry.value['color'],
                isSelected: selectedArchetype == entry.key,
                onTap: () => onSelect(entry.key),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
