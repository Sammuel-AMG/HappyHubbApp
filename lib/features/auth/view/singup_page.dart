// lib/features/auth/view/signup_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:happy_hub/core/constants.dart';
import 'package:happy_hub/data/models/repositories/auth_repo.dart';

class SignUpPage extends ConsumerWidget {
  SignUpPage({super.key});

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _pass = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onSignUp() {
      ref.read(authRepoProvider.notifier).logIn(); // auto-login after register
      context.go('/hub');
    }

    return Scaffold(
      backgroundColor: HHColors.orange,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Cadastro',
                  style: TextStyle(fontSize: 32, color: HHColors.yellow),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: _name,
                  decoration: const InputDecoration(
                    hintText: 'Nome',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
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
                  onPressed: onSignUp,
                  child: const Text('Cadastrar'),
                ),
                TextButton(
                  onPressed: () => context.go('/login'),
                  child: const Text(
                    'Já tem conta? Entrar',
                    style: TextStyle(color: HHColors.yellow),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
