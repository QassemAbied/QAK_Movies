import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/presentation/state_management/authentication_bloc/authentication_bloc.dart';
import 'package:untitled3/presentation/state_management/authentication_bloc/authentication_event.dart';
import 'package:untitled3/presentation/state_management/cubit/cubit.dart';
import 'package:untitled3/presentation/state_management/favorite_bloc/favorit_bloc.dart';
import 'package:untitled3/presentation/state_management/favorite_bloc/favorite_event.dart';
import 'package:untitled3/presentation/state_management/movie_bloc/movie_bloc.dart';
import 'package:untitled3/presentation/state_management/movie_bloc/movie_event.dart';
import 'package:untitled3/presentation/state_management/movie_details_bloc/details_bloc.dart';
import 'package:untitled3/presentation/state_management/watchlist_bloc/watchlist_bloc.dart';
import 'package:untitled3/presentation/state_management/watchlist_bloc/watchlist_event.dart';
import 'package:untitled3/presentation/views/splash_screen.dart';
import 'core/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => Sl<ChangeBottomCubit>(),
        ),
        BlocProvider(
            create: (context) =>
                Sl<AuthenticationBloc>()..add(RequestTokenEvent())),
        BlocProvider(create: (context) => Sl<FavoritesBloc>()),
        BlocProvider(
            create: (BuildContext context) => Sl<MovieBloc>()
              ..add(PopularEvent())
              ..add(GenreEvent())
              ..add(MovieByGenreEvent(28, ''))
              ..add(TopRatedEvent())
              ..add(UpComingEvent())
              ..add(TrendEvent())),
        BlocProvider(
            create: (context) =>
                Sl<WatchlistBloc>()..add(GetWatchListItemsEvent())),
        BlocProvider(create: (context) => Sl<MovieDetailsBloc>()),
        BlocProvider(create: (context) => Sl<FavoritesBloc>()),
        BlocProvider(
          create: (context) =>
              Sl<FavoritesBloc>()..add(GetFavoritesItemsEvent()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: SplashScreen(),
    );
  }
}
