import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/theming/theme_cubit/app_theme_cubit.dart';
import 'package:untitled3/core/theming/theme_cubit/app_theme_state.dart';
import 'package:untitled3/core/theming/theme_eunm/them_eunm.dart';
import 'package:untitled3/features/home/controller/movies_cubit.dart';
import 'package:untitled3/features/watch_list/controller/watch_list_cubit.dart';
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
  final savedMode = await SharedPrefHelper.getString(
    SharedPrefKey.themeModeKey,
  );

  AppThemeMode startMode = AppThemeMode.system;

  if (savedMode != null) {
    startMode = AppThemeMode.values.firstWhere(
      (e) => e.name == savedMode,
      orElse: () => AppThemeMode.system,
    );
  }
  AppLanguage currentLanguage=AppLanguage.english;
  final language=
  await SharedPrefHelper.getString(SharedPrefKey.themeLanguageKey);
  if (language != null) {
    currentLanguage = AppLanguage.values.firstWhere(
          (e) => e.name == language,
      orElse: () => AppLanguage.english,
    );
  }
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
      child: MyApp(startMode,currentLanguage),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppThemeMode startMode;
 final AppLanguage currentLanguage;
  const MyApp(this.startMode, this.currentLanguage, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppThemeCubit, AppThemeState>(
      listener: (context, state) {
        if (state is AppChangeLanguageState) {
          final lang = state.language.code;

          context.read<HomeCubit>().loadHome(lang);
          context.read<GenreCubit>().loadGenresMovies(lang);
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
