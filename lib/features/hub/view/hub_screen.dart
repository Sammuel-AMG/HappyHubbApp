// lib/features/hub/view/hub_screen.dart
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:happy_hub/core/constants.dart';
import 'package:happy_hub/data/models/dummy_data.dart';
import 'package:happy_hub/ui/widgets/promo_card.dart';
import 'package:happy_hub/ui/widgets/top_bars_section.dart';

class HubScreen extends StatelessWidget {
  const HubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 90), // leave space for bottom-nav
      children: const [
        SizedBox(height: 12),
        TopBarsSection(), // horizontal “Bares do mês”
        SizedBox(height: 24),
        _PromotionsSection(), // vertical promo list
      ],
    );
  }
}

/// Vertical list of promo cards.
class _PromotionsSection extends StatelessWidget {
  const _PromotionsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: promos
          .map(
            (p) => Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: PromoCard(promo: p),
            ),
          )
          .toList(),
    );
  }
}
