import 'package:faker/faker.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarUrl,
  });

  factory User.fake() {
    final faker = Faker();
    return User(
      id: faker.guid.guid(),
      name: faker.person.name(),
      email: faker.internet.email(),
      avatarUrl: 'https://i.pravatar.cc/150?img=${faker.randomGenerator.integer(70)}',
    );
  }
}

class AuthState {
  final bool isLoading;
  final User? user;
  final String? error;

  AuthState({
    this.isLoading = false,
    this.user,
    this.error,
  });

  AuthState copyWith({
    bool? isLoading,
    User? user,
    String? error,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      error: error ?? this.error,
    );
  }

  bool get isAuthenticated => user != null;
}

