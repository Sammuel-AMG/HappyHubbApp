// lib/features/auth/view/login_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:happy_hub/core/constants.dart';
import 'package:happy_hub/data/models/repositories/auth_repo.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});

  final _email = TextEditingController();
  final _pass = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onLogin() {
      ref.read(authRepoProvider.notifier).logIn();
      context.go('/hub'); // land on hub after login
    }

    return Scaffold(
      backgroundColor: HHColors.orange,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Entrar',
                style: TextStyle(fontSize: 32, color: HHColors.yellow),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _email,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _pass,
                decoration: const InputDecoration(
                  hintText: 'Senha',
                  filled: true,
                  fillColor: Colors.white,
                ),
                obscureText: true,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: HHColors.yellow,
                  foregroundColor: HHColors.orange,
                ),
                onPressed: onLogin,
                child: const Text('Login'),
              ),
              TextButton(
                onPressed: () => context.go('/signup'),
                child: const Text(
                  'Não tem conta? Cadastre-se',
                  style: TextStyle(color: HHColors.yellow),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
