import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:untitled3/features/watch_list/controller/watch_list_cubit.dart';
import 'core/helpers/extension.dart';
import 'core/routing/router_app.dart';
import 'core/routing/routers.dart';
import 'core/theming/app_theme.dart';
import 'core/theming/theme_cubit/app_theme_cubit.dart';
import 'core/theming/theme_cubit/app_theme_state.dart';
import 'features/favorites/controller/favorites_cubit.dart';
import 'features/home/controller/genres_cubit.dart';
import 'features/home/controller/movies_cubit.dart';
import 'generated/l10n.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocListener<AppThemeCubit, AppThemeState>(
      listener: (context, state) {
        if (state is AppChangeLanguageState) {
          final lang = state.language.code;

          context.read<HomeCubit>().loadHome(lang);
          context.read<GenreCubit>().loadGenresMovies(lang);
          context.read<FavoritesCubit>().loadFavoritesMovies(language: lang);
          context.read<WatchListCubit>().loadWatchList(language: lang);
        }
      },
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) {
          return MaterialApp(
            locale: AppThemeCubit.get(context).localeLanguage(),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: AppTheme.lightTheme(),
            darkTheme: AppTheme.darkTheme(),
            themeMode: AppThemeCubit.get(context).themeMode(),
            initialRoute: Routes.bottonNavScreen,
            onGenerateRoute: RouterApp.generateRoute,
          );
        },
      ),
    );
  }
}
