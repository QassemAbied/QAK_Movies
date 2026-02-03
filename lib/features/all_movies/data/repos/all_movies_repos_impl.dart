import 'package:untitled3/core/network/api_result.dart';
import 'package:untitled3/core/network/api_services.dart';
import 'package:untitled3/features/home/data/models/movies_category.dart';
import 'package:untitled3/features/home/data/models/movies_response_models.dart';
import '../../../../core/network/api_error_handler.dart';
import 'all_movies_repos.dart';

class AllMoviesRepositoryImpl implements AllMoviesRepository {
  final ApiServices _apiServices;
  AllMoviesRepositoryImpl(this._apiServices);
  @override
  Future<ApiResult<MoviesResponse>> getAllMovies({
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
        return _apiServices.getPopularMovies(page: page, language: language);

      case MovieCategory.nowPlaying:
        return _apiServices.getPlayingNowMovies(page: page, language: language);

      case MovieCategory.topRated:
        return _apiServices.getTopRatedMovies(page: page, language: language);

      case MovieCategory.upcoming:
        return _apiServices.getUpComingMovies(page: page, language: language);


      case MovieCategory.trend:
        return _apiServices.getTrendMovies(page: page, language: language);
    }
  }
}
