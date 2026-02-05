import '../theme_eunm/them_eunm.dart';

abstract class AppThemeState {}
class AppIntiThemeState extends AppThemeState{
  final AppThemeMode mode;
  AppIntiThemeState(this.mode);
}

class AppChangeThemeState extends AppThemeState{
  final AppThemeMode mode;
  AppChangeThemeState(this.mode);
}

class AppChangeLanguageState extends AppThemeState{
  final AppLanguage language;
  AppChangeLanguageState(this.language);
}
