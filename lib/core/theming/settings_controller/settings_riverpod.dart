import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled3/core/theming/settings_controller/settings_model.dart';
import '../../helpers/shard_pref_key.dart';
import '../../helpers/shared_pref_helpers.dart';
import '../theme_eunm/them_eunm.dart';

final appSettingsProvider = NotifierProvider<ThemeNotifier, AppSettings>(
  ThemeNotifier.new,
);

class ThemeNotifier extends Notifier<AppSettings> {
  @override
  AppSettings build() {
    final savedLang = SharedPrefHelper.getString(
      SharedPrefKey.themeLanguageKey,
    );

    final savedTheme = SharedPrefHelper.getString(SharedPrefKey.themeModeKey);

    return AppSettings(
      themeMode: savedTheme != null
          ? AppThemeMode.values.byName(savedTheme)
          : AppThemeMode.system,

      locale: savedLang != null && savedLang.isNotEmpty
          ? AppLanguage.values.firstWhere(
              (e) => e.name == savedLang,
              orElse: () => AppLanguage.english,
            )
          : AppLanguage.english,
    );
  }

  Future<void> selectThemeMode(AppThemeMode theme) async {
    state = state.copyWith(themeMode: theme);

    await SharedPrefHelper.setData(SharedPrefKey.themeModeKey, theme.name);
  }

  Future<void> selectLanguage(AppLanguage language) async {
    state = state.copyWith(locale: language);
    await SharedPrefHelper.setData(
      SharedPrefKey.themeLanguageKey,
      language.name,
    );
  }
}
