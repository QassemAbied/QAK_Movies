import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../theming/theme_eunm/them_eunm.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  void pop() {
    if (Navigator.of(this).canPop()) {
      Navigator.of(this).pop();
    }
  }

  void popUntil(String routeName) {
    Navigator.of(this).popUntil((route) => route.settings.name == routeName);
  }


  ColorScheme get colors => Theme.of(this).colorScheme;
}
extension AppLanguageExtension on AppLanguage {
  String get code {
    switch (this) {
      case AppLanguage.english:
        return 'en';
      case AppLanguage.arabic:
        return 'ar';
    }
  }
}

extension ThemeMapper on AppThemeMode {
  ThemeMode toThemeMode() {
    switch (this) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.system:
        return ThemeMode.system;
    }
  }
}
extension LocaleMapper on AppLanguage{
  Locale toLocale(){
    switch (this) {
      case AppLanguage.english:
        return const Locale('en');
      case AppLanguage.arabic:
        return const Locale('ar');
    }
  }
}
