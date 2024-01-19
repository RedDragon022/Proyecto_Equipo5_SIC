import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teachersguard/config/theme/app_theme.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, AppTheme>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  void onThemeChange(bool value) {
    state = state.copyWith(isDarkMode: value);
  }
}

