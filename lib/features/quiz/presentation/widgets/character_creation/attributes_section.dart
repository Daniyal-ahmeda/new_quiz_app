import 'package:flutter/material.dart';
import '../attribute_slider.dart';

class AttributesSection extends StatelessWidget {
  final int intelligence;
  final int creativity;
  final int focus;
  final ValueChanged<double> onIntelligenceChanged;
  final ValueChanged<double> onCreativityChanged;
  final ValueChanged<double> onFocusChanged;
  final VoidCallback onReset;

  const AttributesSection({
    super.key,
    required this.intelligence,
    required this.creativity,
    required this.focus,
    required this.onIntelligenceChanged,
    required this.onCreativityChanged,
    required this.onFocusChanged,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Attributes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: onReset,
              child: const Text('Reset to Default'),
            ),
          ],
        ),
        AttributeSlider(
          label: 'Intelligence',
          value: intelligence,
          color: Colors.blue,
          onChanged: onIntelligenceChanged,
        ),
        AttributeSlider(
          label: 'Creativity',
          value: creativity,
          color: Colors.amber,
          onChanged: onCreativityChanged,
        ),
        AttributeSlider(
          label: 'Focus',
          value: focus,
          color: Colors.purple,
          onChanged: onFocusChanged,
        ),
      ],
    );
  }
}
