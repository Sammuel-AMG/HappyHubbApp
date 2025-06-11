import 'dart:async';
import 'package:flutter/material.dart';
import 'package:happy_hub/core/constants.dart';
import 'package:happy_hub/features/hub/view/hub_shell.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      if (mounted)
        Navigator.of(
          context,
        ).pushReplacement(MaterialPageRoute(builder: (_) => const HubShell()));
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
