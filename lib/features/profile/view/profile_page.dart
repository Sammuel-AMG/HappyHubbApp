import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:happy_hub/core/constants.dart';
import 'package:happy_hub/data/models/repositories/auth_repo.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loggedIn = ref.watch(authRepoProvider);

    if (!loggedIn) {
      // shouldn’t normally happen (router will redirect), but fallback:
      WidgetsBinding.instance.addPostFrameCallback((_) => context.go('/login'));
      return const SizedBox.shrink();
    }

    void onLogout() {
      ref.read(authRepoProvider.notifier).logOut();
      context.go('/login');
    }

    return Scaffold(
      backgroundColor: HHColors.orange,
      appBar: AppBar(
        backgroundColor: HHColors.orange,
        elevation: 0,
        title: const Text('Perfil', style: TextStyle(color: HHColors.yellow)),
        iconTheme: const IconThemeData(color: HHColors.yellow),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: HHColors.yellow,
              child: Icon(Icons.person, size: 40, color: HHColors.orange),
            ),
            const SizedBox(height: 16),
            const Text(
              'Usuário Exemplo',
              style: TextStyle(fontSize: 20, color: HHColors.yellow),
            ),
            const Text(
              'email@exemplo.com',
              style: TextStyle(color: HHColors.yellow),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: HHColors.yellow,
                  foregroundColor: HHColors.orange,
                ),
                onPressed: onLogout,
                child: const Text('Sair'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
