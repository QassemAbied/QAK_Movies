import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled3/core/network/api_result.dart';
import 'package:untitled3/features/home/data/repos/movies_repos.dart';
import '../../providers.dart';
import '../data/models/genre_data.dart';
import '../data/models/movies_genres_models.dart';

class GenreNotifier extends FamilyAsyncNotifier<GenreUiModel, String> {
  MoviesRepository get _repos => ref.watch(homeReposProvider);

  late String _language;

  @override
  Future<GenreUiModel> build(String language) async {
    _language = language;
    return _loadGenres();
  }

  Future<GenreUiModel> _loadGenres() async {
    final response = await _repos.getGenreList(language: _language);

    return response.when(
      success: (genresModels) async {
        final genres = genresModels.genres ?? [];

        if (genres.isEmpty) {
          return GenreUiModel(genres: [], movies: [], selectedGenreId: -1);
        }

        final firstGenreId = genres.first.id!;

        return _loadMovies(genreId: firstGenreId, genres: genres);
      },
      failure: (e) => throw Exception(e.message),
    );
  }

  Future<GenreUiModel> _loadMovies({
    required int genreId,
    required List<GenresModels> genres,
  }) async {
    final response = await _repos.getMoviesByGenre(
      genreId: genreId,
      language: _language,
    );

    return response.when(
      success: (moviesResponse) {
        return GenreUiModel(
          genres: genres,
          movies: moviesResponse.results ?? [],
          selectedGenreId: genreId,
        );
      },
      failure: (e) => throw Exception(e.message),
    );
  }

  Future<void> changeGenre(int genreId) async {
    final current = state.value;
    if (current == null || current.selectedGenreId == genreId) {
      return;
    }

    state = AsyncData(current.copyWith(selectedGenreId: genreId));

    final result = await AsyncValue.guard(
      () => _loadMovies(genreId: genreId, genres: current.genres),
    );

    state = result.when(
      data: (newData) => AsyncData(newData),
      error: (e, stack) => AsyncError(e, stack),
      loading: () => state, // مش هتحصل غالبًا
    );
  }
}
