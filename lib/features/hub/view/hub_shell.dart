// … existing imports …
import 'package:flutter/material.dart';
import 'package:happy_hub/core/constants.dart';
import 'package:happy_hub/features/hub/view/hub_screen.dart';
import 'package:happy_hub/features/map/view/map_stub_page.dart';
import 'package:happy_hub/features/orders/view/orders_page.dart';
import 'package:happy_hub/features/notifications/view/notifications_page.dart';
import 'package:happy_hub/features/profile/view/profile_page.dart';

class HubShell extends StatefulWidget {
  /// new parameter — the route’s inner page
  final Widget child;
  const HubShell({super.key, required this.child});

  @override
  State<HubShell> createState() => _HubShellState();
}

class _HubShellState extends State<HubShell> {
  int _idx = 0;

  static final List<Widget> _pages = [
    const HubScreen(),
    const MapStubPage(),
    const OrdersPage(),
    const NotificationsPage(),
    const ProfilePage(),
  ];

  void _onTap(int i) => setState(() => _idx = i);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // we’ll swap to widget.child in step 4; keep old list for now
      body: _pages[_idx],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _idx,
        onTap: _onTap,
        selectedItemColor: HHColors.yellow,
        unselectedItemColor: HHColors.yellow.withAlpha(150),
        backgroundColor: HHColors.orange,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Hub',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: 'Mapa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: 'Avisos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
