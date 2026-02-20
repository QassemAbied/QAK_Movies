import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled3/features/all_movies/data/models/all_movies_data.dart';
import 'package:untitled3/features/all_movies/data/models/all_movies_params.dart';
import 'package:untitled3/features/all_movies/data/repos/all_movies_repos.dart';
import 'package:untitled3/features/all_movies/data/repos/all_movies_repos_impl.dart';
import 'package:untitled3/features/details_movies/controller/details_riverpod.dart';
import 'package:untitled3/features/details_movies/data/models/details_data.dart';
import 'package:untitled3/features/details_movies/data/repos/details_movies_repos.dart';
import 'package:untitled3/features/details_movies/data/repos/details_movies_repos_impl.dart';
import 'package:untitled3/features/favorites/data/models/fav_data.dart';
import 'package:untitled3/features/favorites/data/repo/favorites_repos.dart';
import 'package:untitled3/features/favorites/data/repo/favorites_repos_impl.dart';
import 'package:untitled3/features/profile/controller/profile_riverpod.dart';
import 'package:untitled3/features/profile/data/models/profile_response.dart';
import 'package:untitled3/features/profile/data/repos/profile_repos.dart';
import 'package:untitled3/features/profile/data/repos/profile_repos_impl.dart';
import 'package:untitled3/features/search/controller/search_riverpod.dart';
import 'package:untitled3/features/search/data/models/search_data.dart';
import 'package:untitled3/features/search/data/models/search_params.dart';
import 'package:untitled3/features/search/data/repos/search_repos.dart';
import 'package:untitled3/features/search/data/repos/search_repos_impl.dart';
import 'package:untitled3/features/watch_list/controller/watch_list_riverpod.dart';
import 'package:untitled3/features/watch_list/data/models/watch_list_data.dart';
import 'package:untitled3/features/watch_list/data/repos/watch_list_repos.dart';
import 'package:untitled3/features/watch_list/data/repos/watch_list_repos_implement.dart';

import '../core/network/api_services.dart';
import '../core/network/dio_factory.dart';
import 'all_movies/controller/all_movies_riverpod.dart';
import 'favorites/controller/fav_riverpod.dart';
import 'home/controller/genres_riverpod.dart';
import 'home/controller/home_riverpod.dart';
import 'details_movies/data/models/details_params.dart';
import 'home/data/models/genre_data.dart';
import 'home/data/models/home_data.dart';
import 'home/data/models/movies_genres_models.dart';
import 'home/data/models/movies_response_models.dart';
import 'home/data/repos/movies_repos.dart';
import 'home/data/repos/movies_repos_impl.dart';

final apiServicesProvider = Provider<ApiServices>((ref) {
  final dio = DioFactory.getDio();
  return ApiServices(dio);
});

final profileRepoProvider = Provider<ProfileRepos>((ref) {
  final api = ref.watch(apiServicesProvider);
  return ProfileReposImpl(api);
});

final profileProvider = AsyncNotifierProvider<ProfileNotifier, ProfileResponse>(
  ProfileNotifier.new,
);
final homeReposProvider = Provider<MoviesRepository>((ref) {
  final api = ref.watch(apiServicesProvider);
  return MoviesRepositoryImpl(api);
});

final homeProvider =
    AsyncNotifierProvider.family<HomeNotifier, HomeData, String>(
      HomeNotifier.new,
    );

final genresProvider =
    AsyncNotifierProvider.family<GenreNotifier, GenreUiModel, String>(
      GenreNotifier.new,
    );

final detailsRepoProvider = Provider<DetailsMoviesRepository>((ref) {
  final api = ref.watch(apiServicesProvider);
  return DetailsMoviesRepositoryImpl(api);
});

final detailsProvider =
    AsyncNotifierProvider.family<DetailsNotifier, DetailsData, DetailsParams>(
      DetailsNotifier.new,
    );

final searchRepoProvider = Provider<SearchRepos>((ref) {
  final api = ref.watch(apiServicesProvider);
  return SearchReposImpl(api);
});

final searchProvider =
    AsyncNotifierProvider.family<SearchNotifier, SearchData, String>(
      SearchNotifier.new,
    );

final favRepoProvider = Provider<FavoritesRepos>((ref) {
  final api = ref.watch(apiServicesProvider);
  return FavoritesReposImpl(api);
});

final favProvider = AsyncNotifierProvider.family<FavNotifier, FavData, String>(
  FavNotifier.new,
);

final watchListRepoProvider = Provider<WatchListRepos>((ref) {
  final api = ref.watch(apiServicesProvider);
  return WatchListReposImplement(api);
});

final watchListProvider = AsyncNotifierProvider.family<WatchListNotifier, WatchListData, String>(
  WatchListNotifier.new,
);

final allMoviesRepoProvider = Provider<AllMoviesRepository>((ref) {
  final api = ref.watch(apiServicesProvider);
  return AllMoviesRepositoryImpl(api);
});

final allMoviesProvider = AsyncNotifierProvider.family<AllMoviesNotifier, AllMoviesData, AllMoviesParams>(
  AllMoviesNotifier.new,
);

