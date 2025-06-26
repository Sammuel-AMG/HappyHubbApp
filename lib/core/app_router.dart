// lib/core/app_router.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:happy_hub/splash_screen.dart';
import 'package:happy_hub/features/auth/view/login_page.dart';
import 'package:happy_hub/features/auth/view/singup_page.dart';
import 'package:happy_hub/features/hub/view/hub_shell.dart';
import 'package:happy_hub/features/hub/view/hub_screen.dart';
import 'package:happy_hub/features/map/view/map_stub_page.dart';
import 'package:happy_hub/features/orders/view/orders_page.dart';
import 'package:happy_hub/features/notifications/view/notifications_page.dart';
import 'package:happy_hub/features/profile/view/profile_page.dart';
import 'package:happy_hub/data/models/repositories/auth_repo.dart'; // ✔ correct path

final routerProvider = Provider<GoRouter>((ref) {
  final bool loggedIn = ref.watch(authRepoProvider);

  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final dest = state.uri.toString();

      // 👉 Allow splash ('/') to appear even if logged out
      if (dest == '/') return null;

      final inAuthFlow = dest == '/login' || dest == '/signup';
      if (!loggedIn && !inAuthFlow) return '/login';
      if (loggedIn && inAuthFlow) return '/hub';
      return null;
    },

    routes: [
      // Splash
      GoRoute(
        path: '/',
        pageBuilder: (_, __) => const NoTransitionPage(child: SplashScreen()),
      ),

      // Auth
      GoRoute(
        path: '/login',
        pageBuilder: (_, __) => NoTransitionPage(child: LoginPage()),
      ),
      GoRoute(
        path: '/signup',
        pageBuilder: (_, __) => NoTransitionPage(child: SignUpPage()),
      ),

      // Shell + branches
      ShellRoute(
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
