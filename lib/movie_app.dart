import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/helpers/extension.dart';
import 'core/routing/router_app.dart';
import 'core/routing/routers.dart';
import 'core/theming/app_theme.dart';
import 'core/theming/settings_controller/settings_riverpod.dart';
import 'generated/l10n.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(

      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final settings = ref.watch(appSettingsProvider);
        return MaterialApp(
           locale: settings.locale.toLocale(),
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
          themeMode: settings.themeMode.toThemeMode(),
          initialRoute: Routes.bottonNavScreen,
          onGenerateRoute: RouterApp.generateRoute,
        );
      }
    );
      
  }
}
