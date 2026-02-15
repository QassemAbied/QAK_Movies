import '../theme_eunm/them_eunm.dart';

class AppSettings {
  final AppThemeMode themeMode;
  final AppLanguage locale;

  AppSettings({required this.themeMode, required this.locale});

  AppSettings copyWith({AppThemeMode? themeMode, AppLanguage? locale}) {
    return AppSettings(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
    );
  }
}
