import 'package:untitled3/features/home/data/models/movies_genres_models.dart';

import '../../../../core/network/api_error_handler.dart';
import '../../../../core/network/api_result.dart';
import '../../../../core/network/api_services.dart';
import '../models/movies_category.dart';
import '../models/movies_response_models.dart';
import 'movies_repos.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final ApiServices apiServices;

  MoviesRepositoryImpl(this.apiServices);

  @override
  Future<ApiResult<MoviesResponse>> getMoviesByCategory({
    required MovieCategory category,
    required int page,
    required String language,
  }) async {
    try {
      final response = await _callApi(
        category: category,
        page: page,
        language: language,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<MoviesResponse> _callApi({
    required MovieCategory category,
    required int page,
    required String language,
  }) {
    switch (category) {
      case MovieCategory.popular:
        return apiServices.getPopularMovies(page: page, language: language);

      case MovieCategory.nowPlaying:
        return apiServices.getPlayingNowMovies(page: page, language: language);

      case MovieCategory.topRated:
        return apiServices.getTopRatedMovies(page: page, language: language);

      case MovieCategory.upcoming:
        return apiServices.getUpComingMovies(page: page, language: language);
    }
  }

  @override
  Future<ApiResult<MoviesResponse>> getMoviesByGenre({
    required int genreId,
    required String language,
  }) async {
    try {
      final response = await apiServices.getMovieByGenre(
          language: language,
        genreId: genreId,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<GenresMoviesModels>> getGenreList({ required String language})async {
    try {
      final response = await apiServices.getGenresMovies(
        language: language,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
