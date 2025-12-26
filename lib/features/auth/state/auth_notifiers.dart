import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectintern/features/auth/state/auth_provider.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState());

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    
    await Future.delayed(const Duration(seconds: 2));

    if (email.isNotEmpty && password.isNotEmpty) {
      state = state.copyWith(
        isLoading: false,
        user: User.fake(),
      );
    } else {
      state = state.copyWith(
        isLoading: false,
        error: 'Invalid credentials',
      );
    }
  }

  Future<void> logout() async {
    state = state.copyWith(isLoading: true);
    await Future.delayed(const Duration(seconds: 1));
    state = AuthState();
  }

  Future<void> register(String name, String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    
    await Future.delayed(const Duration(seconds: 2));

    if (email.isNotEmpty && password.length >= 6) {
      state = state.copyWith(
        isLoading: false,
        user: User.fake(),
      );
    } else {
      state = state.copyWith(
        isLoading: false,
        error: 'Registration failed',
      );
    }
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(),
);