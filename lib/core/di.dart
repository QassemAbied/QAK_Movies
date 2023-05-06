import 'package:get_it/get_it.dart';
import 'package:untitled3/data/data_sources/authentication_remote_data_source.dart';
import 'package:untitled3/data/data_sources/base_remote_data_sources.dart';
import 'package:untitled3/data/data_sources/favorite_remote_data_source.dart';
import 'package:untitled3/data/data_sources/remote_data_source_impl.dart';
import 'package:untitled3/data/data_sources/watchlist_remote_data_source.dart';
import 'package:untitled3/data/repository_data/authentication_repository.dart';
import 'package:untitled3/data/repository_data/favorite_repository_impl.dart';
import 'package:untitled3/data/repository_data/repository_impl.dart';
import 'package:untitled3/data/repository_data/watchlist_repository.dart';
import 'package:untitled3/domain/repository_domain/authentication.dart';
import 'package:untitled3/domain/repository_domain/base_repository.dart';
import 'package:untitled3/domain/repository_domain/favorite_repository.dart';
import 'package:untitled3/domain/repository_domain/watchlist_repository.dart';
import 'package:untitled3/domain/use_case/authentication_use_case/create_session_use_case.dart';
import 'package:untitled3/domain/use_case/authentication_use_case/login_use_case.dart';
import 'package:untitled3/domain/use_case/authentication_use_case/request_token_use_case.dart';
import 'package:untitled3/domain/use_case/details_use_case/castmovie_usecase.dart';
import 'package:untitled3/domain/use_case/details_use_case/check_account_usecase.dart';
import 'package:untitled3/domain/use_case/details_use_case/detail_usecase.dart';
import 'package:untitled3/domain/use_case/favorite_use_case/favorite_usecase.dart';
import 'package:untitled3/domain/use_case/favorite_use_case/remove_favorite_use_case.dart';
import 'package:untitled3/domain/use_case/movies_use_case/genre_usecase.dart';
import 'package:untitled3/domain/use_case/details_use_case/imagemovie_uescase.dart';
import 'package:untitled3/domain/use_case/movies_use_case/moviebygenre_usecase.dart';
import 'package:untitled3/domain/use_case/movies_use_case/popular_usecase.dart';
import 'package:untitled3/domain/use_case/search_usecase.dart';
import 'package:untitled3/domain/use_case/details_use_case/similar_usecase.dart';
import 'package:untitled3/domain/use_case/movies_use_case/toprated_usecase.dart';
import 'package:untitled3/domain/use_case/movies_use_case/trend_usecase.dart';
import 'package:untitled3/domain/use_case/movies_use_case/upcoming_usecase.dart';
import 'package:untitled3/domain/use_case/details_use_case/video_use_case.dart';
import 'package:untitled3/domain/use_case/watchlist_use_case/add_watchlist_usecase.dart';
import 'package:untitled3/domain/use_case/watchlist_use_case/remove_watchlist_usecase.dart';
import 'package:untitled3/domain/use_case/watchlist_use_case/watchlist_usecase.dart';
import 'package:untitled3/presentation/state_management/authentication_bloc/authentication_bloc.dart';
import 'package:untitled3/presentation/state_management/cubit/cubit.dart';
import 'package:untitled3/presentation/state_management/favorite_bloc/favorit_bloc.dart';
import 'package:untitled3/presentation/state_management/movie_bloc/movie_bloc.dart';
import 'package:untitled3/presentation/state_management/movie_details_bloc/details_bloc.dart';
import 'package:untitled3/presentation/state_management/search_bloc/search_bloc.dart';

import '../domain/use_case/favorite_use_case/add_favorite_use_case.dart';
import '../presentation/state_management/watchlist_bloc/watchlist_bloc.dart';

final Sl = GetIt.instance;

class ServiceLocator {
  void init() {
    Sl.registerLazySingleton<RemoteDataSources>(() => RemoteDataSourceImpl());
    Sl.registerLazySingleton<BaseRepository>(() => RepositoryImpl(Sl()));
    Sl.registerLazySingleton<getPopularUseCase>(() => getPopularUseCase(Sl()));
    Sl.registerLazySingleton<getGenreUseCase>(() => getGenreUseCase(Sl()));
    Sl.registerLazySingleton<getMovieByGenresUseCase>(
        () => getMovieByGenresUseCase(Sl()));
    Sl.registerLazySingleton<getTopRatedUseCase>(
        () => getTopRatedUseCase(Sl()));
    Sl.registerLazySingleton<getUpComingUseCase>(
        () => getUpComingUseCase(Sl()));
    Sl.registerLazySingleton<getTrendUseCase>(() => getTrendUseCase(Sl()));
    Sl.registerLazySingleton<getDetailsMovieUseCase>(
        () => getDetailsMovieUseCase(Sl()));
    Sl.registerLazySingleton<getVideoMovieUseCase>(
        () => getVideoMovieUseCase(Sl()));
    Sl.registerLazySingleton<getImageMovieUseCase>(
        () => getImageMovieUseCase(Sl()));
    Sl.registerLazySingleton<getCastMovieUseCase>(
        () => getCastMovieUseCase(Sl()));
    Sl.registerLazySingleton<getSimilarMovieUseCase>(
        () => getSimilarMovieUseCase(Sl()));
    Sl.registerLazySingleton<getSearchMovieUseCase>(
        () => getSearchMovieUseCase(Sl()));
    Sl.registerLazySingleton<getCheckAccountStatesUseCase>(
        () => getCheckAccountStatesUseCase(Sl()));
    Sl.registerLazySingleton<WatchListRepository>(
        () => WatchListRepositoryImpl(Sl()));
    Sl.registerLazySingleton<WatchlistLocalDataSource>(
        () => WatchlistLocalDataSourceImpl());
    Sl.registerLazySingleton<getWatchListUseCase>(
        () => getWatchListUseCase(Sl()));
    Sl.registerLazySingleton<getAddWatchListUseCase>(
        () => getAddWatchListUseCase(Sl()));
    Sl.registerLazySingleton<getRemoveWatchListUseCase>(
        () => getRemoveWatchListUseCase(Sl()));


    Sl.registerLazySingleton<FavoriteRepository>(
        () => FavoriteRepositoryImpl(Sl()));
    Sl.registerLazySingleton<FavoriteRemoteDataSource>(
        () => FavoriteRemoteDataSourceImpl());
    Sl.registerLazySingleton<FavoriteUseCase>(() => FavoriteUseCase(Sl()));
    Sl.registerLazySingleton<getAddFavoriteUseCase>(
        () => getAddFavoriteUseCase(Sl()));
    Sl.registerLazySingleton<getRemoveFavoriteUseCase>(
        () => getRemoveFavoriteUseCase(Sl()));

    Sl.registerLazySingleton<AuthenticationRepository>(
        () => AuthenticationRepositoryImpl(Sl()));
    Sl.registerLazySingleton<AuthenticationRemoteDataSource>(
        () => AuthenticationRemoteDataSourceImpl());
    Sl.registerLazySingleton<RequestTokenUseCase>(
        () => RequestTokenUseCase(Sl()));
    Sl.registerLazySingleton<getLoginValidateUseCase>(
        () => getLoginValidateUseCase(Sl()));
    Sl.registerLazySingleton<getCreateSessionUseCase>(
        () => getCreateSessionUseCase(Sl()));

    Sl.registerFactory(() => MovieBloc(Sl(), Sl(), Sl(), Sl(), Sl(), Sl()));
    Sl.registerFactory(
        () => MovieDetailsBloc(Sl(), Sl(), Sl(), Sl(), Sl(), Sl()));


    Sl.registerFactory(() => ChangeBottomCubit());
    Sl.registerFactory(() => SearchMovieBloc(Sl()));
    Sl.registerFactory(() => WatchlistBloc(Sl(), Sl(), Sl()));
    Sl.registerFactory(() => FavoritesBloc(Sl(), Sl(), Sl()));
    Sl.registerFactory(() => AuthenticationBloc(Sl(), Sl(), Sl()));
  }
}
