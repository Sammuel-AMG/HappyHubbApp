// lib/features/profile/view/profile_page.dart
import 'package:flutter/material.dart';

import 'package:happy_hub/core/constants.dart';

/// Placeholder page for user profile & settings.
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HHColors.orange,
      body: const Center(
        child: Text(
          'Perfil',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: HHColors.yellow,
          ),
        ),
      ),
    );
  }
}
