// lib/features/map/view/map_stub_page.dart
import 'package:flutter/material.dart';

import 'package:happy_hub/core/constants.dart';

/// Placeholder page for the future map/geo feature.
class MapStubPage extends StatelessWidget {
  const MapStubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HHColors.orange,
      body: const Center(
        child: Text(
          'Mapa (em breve)',
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
