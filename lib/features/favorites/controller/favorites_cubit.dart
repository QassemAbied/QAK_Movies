import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/network/api_result.dart';
import 'package:untitled3/features/favorites/data/models/add_favorite_request.dart';
import 'package:untitled3/features/favorites/data/repo/favorites_repos.dart';
import 'package:untitled3/features/home/data/models/movies_response_models.dart';
import 'favorites_state.dart';



class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesRepos _favoritesRepos;

  FavoritesCubit(this._favoritesRepos)
      : super(const FavoritesState.initial());

  final Set<int> favoriteIds = {};
  final List<MovieModel> _favoritesMovies = [];


  Future<void> loadFavoritesMovies({required String language}) async {
    final List<MovieModel> allFavorites = [];

    int page = 1;
    bool hasMore = true;

    while (hasMore) {
      emit(const FavoritesState.loading());
      final response = await _favoritesRepos.getFavoritesMovies(
        language: language,
        page: page,
      );

      response.when(
        success: (favoritesMovies) {
          final list = favoritesMovies.results ?? [];
          allFavorites.addAll(list);

          hasMore = page < (favoritesMovies.totalPages ?? 0);
          page++;
        },
        failure: (error) {
          emit(FavoritesState.error(error: error.message ?? ''));
          hasMore = false;
        },
      );
    }

    final reversed = allFavorites.reversed.toList();

    _favoritesMovies
      ..clear()
      ..addAll(reversed);

    favoriteIds
      ..clear()
      ..addAll(reversed.map((e) => e.id!));

    emit(
      FavoritesState.success(
        favoritesMovies: List.from(_favoritesMovies),
        hasMor: false,
      ),
    );
  }


  Future<void> addFavorites({
    required AddFavoriteRequest addFavoriteRequest,
    required MovieModel movie,
  })
  async {

    _favoritesMovies.insert(0, movie);
    favoriteIds.add(movie.id!);

    emit(
      FavoritesState.success(
        favoritesMovies: List.from(_favoritesMovies),
        hasMor: false,
      ),
    );

    await _favoritesRepos.getAddFavorites(
      addFavoriteRequest: addFavoriteRequest,
    );
  }


  Future<void> removeFavorite({
    required AddFavoriteRequest request,
  })
  async {

    _favoritesMovies
        .removeWhere((e) => e.id == request.mediaId);
    favoriteIds.remove(request.mediaId);

    emit(
      FavoritesState.success(
        favoritesMovies: List.from(_favoritesMovies),
        hasMor: false,
      ),
    );

    await _favoritesRepos.getAddFavorites(
      addFavoriteRequest: request,
    );
  }
}
