import 'package:flutter/material.dart';
import 'package:untitled3/core/routing/routers.dart';
import 'package:untitled3/features/all_movies/view/all_movies_screen.dart';
import 'package:untitled3/features/home/view/home_screen.dart';

import '../../features/home/data/models/movies_category.dart';



class RouterApp {
 static Route? generateRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.homeScreen:
        {
          return MaterialPageRoute(builder: (_) => HomeScreen());
        }
      case Routes.allMoviesScreen:
      final movieCategory = settings.arguments as MovieCategory;
        {
          return MaterialPageRoute(builder: (_) => AllMoviesScreen(category: movieCategory));
        }

    }
    return null;
  }
}