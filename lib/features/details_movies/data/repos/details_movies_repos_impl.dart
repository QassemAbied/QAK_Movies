import 'package:untitled3/core/network/api_services.dart';
import 'package:untitled3/features/details_movies/data/models/credits_response.dart';
import 'package:untitled3/features/details_movies/data/models/details_movies_response.dart';
import 'package:untitled3/features/details_movies/data/models/images_movies_response.dart';
import 'package:untitled3/features/details_movies/data/models/video_response.dart';
import 'package:untitled3/features/details_movies/data/repos/details_movies_repos.dart';
import 'package:untitled3/features/home/data/models/movies_response_models.dart';

import '../../../../core/network/api_error_handler.dart';
import '../../../../core/network/api_result.dart';

class DetailsMoviesRepositoryImpl implements DetailsMoviesRepository {
  final ApiServices _apiServices;
  DetailsMoviesRepositoryImpl(this._apiServices);

  @override
  Future<ApiResult<DetailsMoviesResponse>> getDetailsMovies({
    required String language,
    required int id,
  }) async {
    try {
      final response = await _apiServices.getMoviesDetails(
        id: id,
        language: language,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<CreditsResponse>> getCastForMovies({
    required String language,
    required int id,
  }) async {
    try {
      final response = await _apiServices.getCastForMovies(
        id: id,
        language: language,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<ImagesMoviesResponse>> getImageForMovies({
    required int id,
  }) async {
    try {
      final response = await _apiServices.getImageForMovies(id: id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<MoviesResponse>> getSimilarMovies({
    required String language,
    required int id,
  }) async {
    try {
      final response = await _apiServices.getSimilarMovies(
        id: id,
        language: language,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<VideoResponses>> getVideoMovies({
    required String language,
    required int id,
  }) async {
    try {
      final response = await _apiServices.getVideoMovies(
        id: id,
        language: language,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
