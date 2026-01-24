import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/network/api_error_model.dart';
import '../data/models/movies_genres_models.dart';
import '../data/models/movies_response_models.dart';
part 'genres_state.freezed.dart';



@Freezed()
class GenreState with _$GenreState {
  const factory GenreState.initial() = _GenresInitial;
  const factory GenreState.genresLoading() = GenresLoading;
  const factory GenreState.genresSuccess({
    required List<GenresModels> genres,
    required List<MovieModel> moviesByGenres,
    required int selectedGenreId,

  }) = GenresSuccess;
  const factory GenreState.genresError({required ApiErrorModel  error}) = GenresError;
}