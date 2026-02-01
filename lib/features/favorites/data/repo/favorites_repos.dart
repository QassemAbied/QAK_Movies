import 'package:untitled3/core/network/api_result.dart';
import 'package:untitled3/features/favorites/data/models/add_fav_response.dart';
import 'package:untitled3/features/favorites/data/models/add_favorite_request.dart';
import 'package:untitled3/features/home/data/models/movies_response_models.dart';

abstract class FavoritesRepos {
  Future<ApiResult<MoviesResponse>> getFavoritesMovies({required String language, required int page});
  Future<ApiResult<AddFavResponse>> getAddFavorites({
    required AddFavoriteRequest addFavoriteRequest,
  });
}
