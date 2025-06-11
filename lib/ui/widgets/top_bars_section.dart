import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:happy_hub/core/constants.dart';
import 'package:happy_hub/data/models/dummy_data.dart';

class TopBarsSection extends StatelessWidget {
  const TopBarsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Bares do mês',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: HHColors.yellow,
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 90,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: bars.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (_, i) => Column(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: CachedNetworkImageProvider(bars[i].logoUrl),
                ),
                const SizedBox(height: 4),
                Text(
                  bars[i].name,
                  style: const TextStyle(fontSize: 12, color: HHColors.yellow),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
