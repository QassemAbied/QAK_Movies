import 'package:untitled3/features/home/data/models/movies_genres_models.dart';

import '../../../../core/network/api_result.dart';
import '../models/movies_category.dart';
import '../models/movies_response_models.dart';

abstract class MoviesRepository {
  Future<ApiResult<MoviesResponse>> getMoviesByCategory({
    required MovieCategory category,
    required int page,
    required String language,
  });
  Future<ApiResult<MoviesResponse>> getMoviesByGenre({
    required int genreId,
    required String language,
});
  Future<ApiResult<GenresMoviesModels>> getGenreList({
    required String language,
  });
}
