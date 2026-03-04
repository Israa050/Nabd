import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_demo/core/storage/app_storage.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> with WidgetsBindingObserver {
  AppThemeCubit() : super(AppThemeState(themeMode: ThemeMode.system)) {
    WidgetsBinding.instance.addObserver(this);
    loadTheme();
  }

  @override
  Future<void> close() {
    WidgetsBinding.instance.removeObserver(this);
    return super.close();
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    _handleSystemThemeChange();
  }

  Future<void> _handleSystemThemeChange() async {
    await AppLaunchHelper.clearThemeMode();
    emit(AppThemeState(themeMode: ThemeMode.system));
  }

  Future<void> loadTheme() async {
    final isDark = await AppLaunchHelper.getThemeMode();
    if (isDark == null) {
      emit(AppThemeState(themeMode: ThemeMode.system));
    } else {
      emit(AppThemeState(themeMode: isDark ? ThemeMode.dark : ThemeMode.light));
    }
  }

  Future<void> changeTheme(bool isDark) async {
    await AppLaunchHelper.setThemeMode(isDark);
    emit(AppThemeState(themeMode: isDark ? ThemeMode.dark : ThemeMode.light));
  }
}
