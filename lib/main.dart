import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/theming/theme_cubit/app_theme_cubit.dart';
import 'package:untitled3/core/theming/theme_cubit/app_theme_state.dart';
import 'package:untitled3/core/theming/theme_eunm/them_eunm.dart';
import 'package:untitled3/features/home/controller/movies_cubit.dart';
import 'package:untitled3/features/watch_list/controller/watch_list_cubit.dart';
import 'package:untitled3/movie_app.dart';
import 'core/di.dart';
import 'core/helpers/extension.dart';
import 'core/helpers/shard_pref_key.dart';
import 'core/helpers/shared_pref_helpers.dart';
import 'core/routing/router_app.dart';
import 'core/routing/routers.dart';
import 'core/theming/app_theme.dart';
import 'features/favorites/controller/favorites_cubit.dart';
import 'features/home/controller/genres_cubit.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final startMode = await getSavedTheme();
  final currentLanguage = await getSavedLanguage();
  ServiceLocator().init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AppThemeCubit(startMode, currentLanguage)),
        BlocProvider(
          create: (context) =>
              Sl<HomeCubit>()
                ..loadHome(context.read<AppThemeCubit>().currentLanguage.code),
        ),
        BlocProvider(
          create: (context) => Sl<GenreCubit>()
            ..loadGenresMovies(
                context.read<AppThemeCubit>().currentLanguage.code
            ),
        ),
        BlocProvider(
          create: (context) => Sl<FavoritesCubit>()..loadFavoritesMovies(
              language: context.read<AppThemeCubit>().currentLanguage.code),

        ),
        BlocProvider(
          create: (context) => Sl<WatchListCubit>()..loadWatchList(
              language: context.read<AppThemeCubit>().currentLanguage.code),

        ),
      ],
      child: const MovieApp(),
    ),
  );
}
Future<AppThemeMode> getSavedTheme() async {
  final savedMode =
  await SharedPrefHelper.getString(SharedPrefKey.themeModeKey);

  if (savedMode != null) {
    return AppThemeMode.values.firstWhere(
          (e) => e.name == savedMode,
      orElse: () => AppThemeMode.system,
    );
  }
  return AppThemeMode.system;
}
Future<AppLanguage> getSavedLanguage() async {
  final language =
  await SharedPrefHelper.getString(SharedPrefKey.themeLanguageKey);

  if (language != null) {
    return AppLanguage.values.firstWhere(
          (e) => e.name == language,
      orElse: () => AppLanguage.english,
    );
  }

  return AppLanguage.english;
}


