import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:happy_hub/core/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // after 2 s jump to hub via GoRouter
    Timer(const Duration(seconds: 2), () {
      if (mounted) context.go('/hub');
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: HHColors.orange,
    body: const Center(
      child: Text(
        'Happy Hub',
        style: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.bold,
          color: HHColors.yellow,
        ),
      ),
    ),
  );
}
