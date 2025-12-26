import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AppThemeMode { light, dark, system }

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>(
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.light);

  void toggleTheme() {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }

  void setThemeMode(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.light:
        state = ThemeMode.light;
        break;
      case AppThemeMode.dark:
        state = ThemeMode.dark;
        break;
      case AppThemeMode.system:
        state = ThemeMode.system;
        break;
    }
  }
}