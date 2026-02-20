import 'package:flutter/material.dart';
import 'package:untitled3/core/routing/routers.dart';
import 'package:untitled3/features/all_movies/view/all_movies_screen.dart';
import 'package:untitled3/features/botton_nav/botton_nav_screen.dart';
import 'package:untitled3/features/details_movies/view/details_screen.dart';
import 'package:untitled3/features/home/view/home_screen.dart';
import 'package:untitled3/features/profile/view/widgets/profile_screen.dart';
import 'package:untitled3/features/watch_list/view/watch_list_screen.dart';
import '../../features/home/data/models/movies_category.dart';


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
            builder: (_) => DetailsScreen(movieId: movieId,),
          );
        }
      case Routes.bottonNavScreen:
        {
          return MaterialPageRoute(
            builder: (_) => BottonNavScreen(),
          );
        }
      case Routes.profileScreen:
        {
          return MaterialPageRoute(
            builder: (_) => const ProfileScreen(),
          );
        }
    }
    return null;
  }
}
