part of 'app_theme_cubit.dart';

class AppThemeState {
  final ThemeMode themeMode;

  const AppThemeState({required this.themeMode});

  bool get isDarkMode => themeMode == ThemeMode.dark;
}
