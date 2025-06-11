import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:happy_hub/core/constants.dart';

class HubShell extends StatefulWidget {
  final Widget child; // page supplied by ShellRoute
  const HubShell({super.key, required this.child});

  @override
  State<HubShell> createState() => _HubShellState();
}

class _HubShellState extends State<HubShell> {
  // path list aligns with bottom-nav order
  static const _paths = [
    '/hub',
    '/map',
    '/orders',
    '/notifications',
    '/profile',
  ];
  int _idx = 0;

  void _onTap(int i) {
    if (i == _idx) return; // already there
    setState(() => _idx = i);
    context.go(_paths[i]); // use GoRouter
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child, // <<< use routed child
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
