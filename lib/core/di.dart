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
import 'package:untitled3/features/search/controller/search_cubit.dart';
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
            () => AllMoviesRepositoryImpl(Sl<ApiServices>()),);
    Sl.registerFactory(() => HomeCubit(Sl()));
      Sl.registerFactory(() => GenreCubit(Sl()));
    Sl.registerFactory(() => AppThemeCubit( AppThemeMode.system,
      AppLanguage.english,));

    Sl.registerLazySingleton<DetailsMoviesRepository>(
          () => DetailsMoviesRepositoryImpl(Sl<ApiServices>()),);
    Sl.registerFactory(() => DetailsMoviesCubit(Sl()));


    Sl.registerLazySingleton<FavoritesRepos>(
          () => FavoritesReposImpl(Sl<ApiServices>()),);
    Sl.registerFactory(() => FavoritesCubit(Sl()));

    Sl.registerLazySingleton<WatchListRepos>(
          () => WatchListReposImplement(Sl<ApiServices>()),);
    Sl.registerFactory(() => WatchListCubit(Sl()));

    Sl.registerLazySingleton<SearchRepos>(
          () => SearchReposImpl(Sl<ApiServices>()),);
   // Sl.registerFactory(() => SearchCubit(Sl(), ));
    //Sl.registerLazySingleton<RemoteDataSources>(() => RemoteDataSourceImpl());
    // Sl.registerLazySingleton<BaseRepository>(() => RepositoryImpl(Sl()));
    // Sl.registerLazySingleton<getPopularUseCase>(() => getPopularUseCase(Sl()));
    // Sl.registerLazySingleton<getGenreUseCase>(() => getGenreUseCase(Sl()));
    // Sl.registerLazySingleton<getMovieByGenresUseCase>(
    //     () => getMovieByGenresUseCase(Sl()));
    // Sl.registerLazySingleton<getTopRatedUseCase>(
    //     () => getTopRatedUseCase(Sl()));
    // Sl.registerLazySingleton<getUpComingUseCase>(
    //     () => getUpComingUseCase(Sl()));
    // Sl.registerLazySingleton<getTrendUseCase>(() => getTrendUseCase(Sl()));
    // Sl.registerLazySingleton<getDetailsMovieUseCase>(
    //     () => getDetailsMovieUseCase(Sl()));
    // Sl.registerLazySingleton<getVideoMovieUseCase>(
    //     () => getVideoMovieUseCase(Sl()));
    // Sl.registerLazySingleton<getImageMovieUseCase>(
    //     () => getImageMovieUseCase(Sl()));
    // Sl.registerLazySingleton<getCastMovieUseCase>(
    //     () => getCastMovieUseCase(Sl()));
    // Sl.registerLazySingleton<getSimilarMovieUseCase>(
    //     () => getSimilarMovieUseCase(Sl()));
    // Sl.registerLazySingleton<getSearchMovieUseCase>(
    //     () => getSearchMovieUseCase(Sl()));
    // Sl.registerLazySingleton<getCheckAccountStatesUseCase>(
    //     () => getCheckAccountStatesUseCase(Sl()));
    // Sl.registerLazySingleton<WatchListRepository>(
    //     () => WatchListRepositoryImpl(Sl()));
    // Sl.registerLazySingleton<WatchlistLocalDataSource>(
    //     () => WatchlistLocalDataSourceImpl());
    // Sl.registerLazySingleton<getWatchListUseCase>(
    //     () => getWatchListUseCase(Sl()));
    // Sl.registerLazySingleton<getAddWatchListUseCase>(
    //     () => getAddWatchListUseCase(Sl()));
    // Sl.registerLazySingleton<getRemoveWatchListUseCase>(
    //     () => getRemoveWatchListUseCase(Sl()));
    //
    //
    // Sl.registerLazySingleton<FavoriteRepository>(
    //     () => FavoriteRepositoryImpl(Sl()));
    // Sl.registerLazySingleton<FavoriteRemoteDataSource>(
    //     () => FavoriteRemoteDataSourceImpl());
    // Sl.registerLazySingleton<FavoriteUseCase>(() => FavoriteUseCase(Sl()));
    // Sl.registerLazySingleton<getAddFavoriteUseCase>(
    //     () => getAddFavoriteUseCase(Sl()));
    // Sl.registerLazySingleton<getRemoveFavoriteUseCase>(
    //     () => getRemoveFavoriteUseCase(Sl()));
    //
    // Sl.registerLazySingleton<AuthenticationRepository>(
    //     () => AuthenticationRepositoryImpl(Sl()));
    // Sl.registerLazySingleton<AuthenticationRemoteDataSource>(
    //     () => AuthenticationRemoteDataSourceImpl());
    // Sl.registerLazySingleton<RequestTokenUseCase>(
    //     () => RequestTokenUseCase(Sl()));
    // Sl.registerLazySingleton<getLoginValidateUseCase>(
    //     () => getLoginValidateUseCase(Sl()));
    // Sl.registerLazySingleton<getCreateSessionUseCase>(
    //     () => getCreateSessionUseCase(Sl()));

    // Sl.registerFactory(() => MovieBloc(Sl(), Sl(), Sl(), Sl(), Sl(), Sl()));
    // Sl.registerFactory(
    //     () => MovieDetailsBloc(Sl(), Sl(), Sl(), Sl(), Sl(), Sl()));
    //
    //
    // Sl.registerFactory(() => ChangeBottomCubit());
    // Sl.registerFactory(() => SearchMovieBloc(Sl()));
    // Sl.registerFactory(() => WatchlistBloc(Sl(), Sl(), Sl()));
    // Sl.registerFactory(() => FavoritesBloc(Sl(), Sl(), Sl()));
    // Sl.registerFactory(() => AuthenticationBloc(Sl(), Sl(), Sl()));
  }
}
