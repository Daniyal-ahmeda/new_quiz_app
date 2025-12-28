import 'package:flutter/material.dart';
import '../../../../../features/auth/presentation/widgets/auth_text_field.dart';

class IdentitySection extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController descController;

  const IdentitySection({
    super.key,
    required this.nameController,
    required this.descController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Identity',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        AuthTextField(
          controller: nameController,
          label: 'Character Name',
          hint: 'e.g., Prof. Oak',
          icon: Icons.person,
        ),
        const SizedBox(height: 16),
        AuthTextField(
          controller: descController,
          label: 'Backstory (Optional)',
          hint: 'A brief history...',
          icon: Icons.history,
        ),
      ],
    );
  }
}
