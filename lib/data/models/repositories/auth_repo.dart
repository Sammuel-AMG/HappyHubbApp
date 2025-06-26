import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Very dumb in-memory auth state.
class AuthRepository extends StateNotifier<bool> {
  AuthRepository() : super(false); // false = logged-out

  bool get isLoggedIn => state;

  void logIn() => state = true;
  void logOut() => state = false;
}

/// Riverpod provider you can watch or mutate anywhere.
final authRepoProvider = StateNotifierProvider<AuthRepository, bool>(
  (_) => AuthRepository(),
);
