import 'package:untitled3/core/network/api_services.dart';
import 'package:untitled3/features/favorites/data/models/add_fav_response.dart';
import 'package:untitled3/features/favorites/data/models/add_favorite_request.dart';
import 'package:untitled3/features/favorites/data/repo/favorites_repos.dart';
import 'package:untitled3/features/home/data/models/movies_response_models.dart';

import '../../../../core/network/api_error_handler.dart';
import '../../../../core/network/api_result.dart';

class FavoritesReposImpl implements FavoritesRepos {
  final ApiServices _apiServices;
  FavoritesReposImpl(this._apiServices);
  @override
  Future<ApiResult<AddFavResponse>> getAddFavorites({
    required AddFavoriteRequest addFavoriteRequest,
  }) async {
    try {
      final response = await _apiServices.getAddFavorites(
        favoriteBody: addFavoriteRequest,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<MoviesResponse>> getFavoritesMovies({
    required String language,
    required int page
  }) async {
    try {
      final response = await _apiServices.getFavoritesMovies(
        language: language, page: page,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
