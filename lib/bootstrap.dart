// lib/bootstrap.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:happy_hub/core/app_router.dart';
import 'package:happy_hub/core/theme.dart';

/// Entry point called by main.dart
void main() {
  runApp(const ProviderScope(child: HappyHubApp()));
}

/// Root widget configured for Riverpod + GoRouter.
class HappyHubApp extends ConsumerWidget {
  const HappyHubApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'Happy Hub',
      debugShowCheckedModeBanner: false,
      theme: hhTheme,
      routerConfig: router,
    );
  }
}
