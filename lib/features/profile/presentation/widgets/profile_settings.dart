import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_card.dart';
import '../../../../core/widgets/section_header.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(title: 'Account Settings'),
        const SizedBox(height: 8),
        _buildSettingTile(
          context,
          icon: Icons.person,
          title: 'Edit Profile',
          subtitle: 'Change name and avatar',
          onTap: () {},
        ),
        _buildSettingTile(
          context,
          icon: Icons.notifications,
          title: 'Notifications',
          subtitle: 'Quiz reminders',
          onTap: () {},
        ),
        _buildSettingTile(
          context,
          icon: Icons.lock,
          title: 'Privacy',
          subtitle: 'Password and security',
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildSettingTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: CustomCard(
        onTap: onTap,
        child: ListTile(
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFE3F2FD),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: const Color(0xFF1E88E5)),
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(subtitle),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
