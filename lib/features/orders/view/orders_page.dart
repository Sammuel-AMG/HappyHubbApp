// lib/features/orders/view/orders_page.dart
import 'package:flutter/material.dart';

import 'package:happy_hub/core/constants.dart';

/// Placeholder page for the user’s delivery / order history.
class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HHColors.orange,
      body: const Center(
        child: Text(
          'Pedidos',
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
