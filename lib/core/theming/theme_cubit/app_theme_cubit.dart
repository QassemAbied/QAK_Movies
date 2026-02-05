import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/helpers/shard_pref_key.dart';
import 'package:untitled3/core/theming/theme_eunm/them_eunm.dart';
import '../../helpers/shared_pref_helpers.dart';
import 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeMode currentMode;
  AppLanguage currentLanguage;
  AppThemeCubit(this.currentMode, this.currentLanguage)
    : super(AppIntiThemeState(currentMode));

  static AppThemeCubit get(context) => BlocProvider.of(context);

  Future<void> selectThemeMode(AppThemeMode theme) async {
    currentMode = theme;

    await SharedPrefHelper.setData(
      SharedPrefKey.themeModeKey,
      currentMode.name,
    );
    emit(AppChangeThemeState(currentMode));
  }

  ThemeMode themeMode() {
    switch (currentMode) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.system:
        return ThemeMode.system;
    }
  }

  Future<void> changeLanguage(AppLanguage theme) async {
    currentLanguage = theme;
    await SharedPrefHelper.setData(
      SharedPrefKey.themeLanguageKey,
      currentLanguage.name,
    );
    emit(AppChangeLanguageState(currentLanguage));
  }

  Locale localeLanguage() {
    switch (currentLanguage) {
      case AppLanguage.english:
        return const Locale('en');
      case AppLanguage.arabic:
        return const Locale('ar');
    }
  }
}
