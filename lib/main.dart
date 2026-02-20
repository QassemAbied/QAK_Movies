import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled3/core/theming/theme_eunm/them_eunm.dart';
import 'package:untitled3/movie_app.dart';
import 'core/helpers/shard_pref_key.dart';
import 'core/helpers/shared_pref_helpers.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefHelper.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MovieApp()));
}

Future<AppThemeMode> getSavedTheme() async {
  final savedMode = await SharedPrefHelper.getString(
    SharedPrefKey.themeModeKey,
  );

  if (savedMode != null) {
    return AppThemeMode.values.firstWhere(
      (e) => e.name == savedMode,
      orElse: () => AppThemeMode.system,
    );
  }
  return AppThemeMode.system;
}

Future<AppLanguage> getSavedLanguage() async {
  final language = await SharedPrefHelper.getString(
    SharedPrefKey.themeLanguageKey,
  );

  if (language != null) {
    return AppLanguage.values.firstWhere(
      (e) => e.name == language,
      orElse: () => AppLanguage.english,
    );
  }

  return AppLanguage.english;
}
