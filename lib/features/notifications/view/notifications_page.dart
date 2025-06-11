// lib/features/notifications/view/notifications_page.dart
import 'package:flutter/material.dart';

import 'package:happy_hub/core/constants.dart';

/// Stub page for notifications & events.
class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HHColors.orange,
      body: const Center(
        child: Text(
          'Notificações',
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
