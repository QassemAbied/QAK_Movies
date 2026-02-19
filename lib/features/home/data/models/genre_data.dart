import 'movies_genres_models.dart';
import 'movies_response_models.dart';

class GenreUiModel {
  final List<GenresModels> genres;
  final List<MovieModel> movies;
  final int selectedGenreId;
  final bool isMoviesLoading;

  GenreUiModel({
    required this.genres,
    required this.movies,
    required this.selectedGenreId,
    this.isMoviesLoading = false,
  });

  GenreUiModel copyWith({
    List<GenresModels>? genres,
    List<MovieModel>? movies,
    int? selectedGenreId,
    bool? isMoviesLoading,
  }) {
    return GenreUiModel(
      genres: genres ?? this.genres,
      movies: movies ?? this.movies,
      selectedGenreId: selectedGenreId ?? this.selectedGenreId,
      isMoviesLoading: isMoviesLoading ?? this.isMoviesLoading,
    );
  }
}
