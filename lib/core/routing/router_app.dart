import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/routing/routers.dart';
import 'package:untitled3/features/all_movies/view/all_movies_screen.dart';
import 'package:untitled3/features/botton_nav/botton_nav_screen.dart';
import 'package:untitled3/features/details_movies/view/details_screen.dart';
import 'package:untitled3/features/home/view/home_screen.dart';
import 'package:untitled3/features/profile/controller/profile_cubit.dart';
import 'package:untitled3/features/profile/view/widgets/profile_screen.dart';
import 'package:untitled3/features/watch_list/view/watch_list_screen.dart';

import '../../features/botton_nav/controller/botton_nav_cubit.dart';
import '../../features/details_movies/controller/details_movies_cubit.dart';
import '../../features/home/data/models/movies_category.dart';
import '../di.dart';
import '../helpers/extension.dart';
import '../theming/theme_cubit/app_theme_cubit.dart';

class RouterApp {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        {
          return MaterialPageRoute(builder: (_) => const HomeScreen());
        }
      case Routes.watchListScreen:
        {
          return MaterialPageRoute(builder: (_) => const WatchListScreen());
        }
      case Routes.allMoviesScreen:
        final movieCategory = settings.arguments as MovieCategory;
        {
          return MaterialPageRoute(
            builder: (_) => AllMoviesScreen(category: movieCategory),
          );
        }
      case Routes.detailsMoviesScreen:
        final movieId = settings.arguments as int;
        {
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => Sl<DetailsMoviesCubit>()
                ..loadDetailsMovies(
                  id: movieId,
                  language: AppThemeCubit.get(context).currentLanguage.code,
                ),
              child: const DetailsScreen(),
            ),
          );
        }
      case Routes.bottonNavScreen:
        {
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => ChangeBottomCubit(),
              child: BottonNavScreen(),
            ),
          );
        }
      case Routes.profileScreen:
        {
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => Sl<ProfileCubit>()..loadProfile(),
              child: const ProfileScreen(),
            ),
          );
        }
    }
    return null;
  }
}
