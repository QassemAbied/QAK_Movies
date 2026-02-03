import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:untitled3/core/theming/theme_cubit/app_theme_cubit.dart';
import 'package:untitled3/core/theming/theme_eunm/them_eunm.dart';
import 'package:untitled3/features/all_movies/data/repos/all_movies_repos.dart';
import 'package:untitled3/features/all_movies/data/repos/all_movies_repos_impl.dart';
import 'package:untitled3/features/details_movies/controller/details_movies_cubit.dart';
import 'package:untitled3/features/details_movies/data/repos/details_movies_repos.dart';
import 'package:untitled3/features/details_movies/data/repos/details_movies_repos_impl.dart';
import 'package:untitled3/features/favorites/data/repo/favorites_repos.dart';
import 'package:untitled3/features/favorites/data/repo/favorites_repos_impl.dart';
import 'package:untitled3/features/home/controller/movies_cubit.dart';
import 'package:untitled3/features/profile/controller/profile_cubit.dart';
import 'package:untitled3/features/profile/data/repos/profile_repos.dart';
import 'package:untitled3/features/profile/data/repos/profile_repos_impl.dart';
import 'package:untitled3/features/search/data/repos/search_repos.dart';
import 'package:untitled3/features/search/data/repos/search_repos_impl.dart';
import 'package:untitled3/features/watch_list/controller/watch_list_cubit.dart';
import 'package:untitled3/features/watch_list/data/repos/watch_list_repos.dart';
import 'package:untitled3/features/watch_list/data/repos/watch_list_repos_implement.dart';
import '../features/favorites/controller/favorites_cubit.dart';
import '../features/home/controller/genres_cubit.dart';
import '../features/home/data/repos/movies_repos.dart';
import '../features/home/data/repos/movies_repos_impl.dart';
import 'network/api_services.dart';
import 'network/dio_factory.dart';

final Sl = GetIt.instance;

class ServiceLocator {
  void init() {
    Dio dio = DioFactory.getDio();
    Sl.registerLazySingleton<ApiServices>(() => ApiServices(dio));

    Sl.registerLazySingleton<MoviesRepository>(
      () => MoviesRepositoryImpl(Sl<ApiServices>()),
    );
    Sl.registerLazySingleton<AllMoviesRepository>(
      () => AllMoviesRepositoryImpl(Sl<ApiServices>()),
    );
    Sl.registerFactory(() => HomeCubit(Sl()));
    Sl.registerFactory(() => GenreCubit(Sl()));
    Sl.registerFactory(
      () => AppThemeCubit(AppThemeMode.system, AppLanguage.english),
    );

    Sl.registerLazySingleton<DetailsMoviesRepository>(
      () => DetailsMoviesRepositoryImpl(Sl<ApiServices>()),
    );
    Sl.registerFactory(() => DetailsMoviesCubit(Sl()));

    Sl.registerLazySingleton<FavoritesRepos>(
      () => FavoritesReposImpl(Sl<ApiServices>()),
    );
    Sl.registerFactory(() => FavoritesCubit(Sl()));

    Sl.registerLazySingleton<WatchListRepos>(
      () => WatchListReposImplement(Sl<ApiServices>()),
    );
    Sl.registerFactory(() => WatchListCubit(Sl()));

    Sl.registerLazySingleton<SearchRepos>(
      () => SearchReposImpl(Sl<ApiServices>()),
    );

    Sl.registerLazySingleton<ProfileRepos>(
      () => ProfileReposImpl(Sl<ApiServices>()),
    );
    Sl.registerFactory(() => ProfileCubit(Sl()));
  }
}
