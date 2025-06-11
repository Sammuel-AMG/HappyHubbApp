// lib/core/app_router.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:happy_hub/splash_screen.dart';
import 'package:happy_hub/features/hub/view/hub_shell.dart';
import 'package:happy_hub/features/hub/view/hub_screen.dart';
import 'package:happy_hub/features/map/view/map_stub_page.dart';
import 'package:happy_hub/features/orders/view/orders_page.dart';
import 'package:happy_hub/features/notifications/view/notifications_page.dart';
import 'package:happy_hub/features/profile/view/profile_page.dart';

/// Riverpod provider that exposes a configured GoRouter instance.
/// Any widget can `ref.watch(routerProvider)` to get navigation.
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/', // start on splash
    routes: [
      /// -------- Splash (stand-alone) --------
      GoRoute(
        path: '/',
        pageBuilder: (_, __) => const NoTransitionPage(child: SplashScreen()),
      ),

      /// -------- Shell with bottom-nav --------
      ShellRoute(
        // keeps HubShell alive while switching its branch pages
        builder: (_, __, child) => HubShell(child: child),
        routes: [
          GoRoute(
            path: '/hub',
            pageBuilder: (_, __) => const NoTransitionPage(child: HubScreen()),
          ),
          GoRoute(
            path: '/map',
            pageBuilder: (_, __) =>
                const NoTransitionPage(child: MapStubPage()),
          ),
          GoRoute(
            path: '/orders',
            pageBuilder: (_, __) => const NoTransitionPage(child: OrdersPage()),
          ),
          GoRoute(
            path: '/notifications',
            pageBuilder: (_, __) =>
                const NoTransitionPage(child: NotificationsPage()),
          ),
          GoRoute(
            path: '/profile',
            pageBuilder: (_, __) =>
                const NoTransitionPage(child: ProfilePage()),
          ),
        ],
      ),
    ],
  );
});
