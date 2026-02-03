import 'package:untitled3/core/network/api_result.dart';
import 'package:untitled3/core/network/api_services.dart';
import 'package:untitled3/features/home/data/models/movies_response_models.dart';
import 'package:untitled3/features/watch_list/data/models/add_watch_list_requst.dart';
import 'package:untitled3/features/watch_list/data/models/add_watch_list_response.dart';
import 'package:untitled3/features/watch_list/data/repos/watch_list_repos.dart';

import '../../../../core/network/api_error_handler.dart';

class WatchListReposImplement implements WatchListRepos {
  final ApiServices _apiServices;
  WatchListReposImplement(this._apiServices);
  @override
  Future<ApiResult<AddWatchListResponse>> addWitchList({
    required AddWatchListRequest addWatchListRequest,
  }) async {
    try {
      final response = await _apiServices.getAddWatchList(
        addWatchListRequest: addWatchListRequest,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<MoviesResponse>> getWatchListMovies({
    required String language,
    required int page,
  }) async {
    try {
      final response = await _apiServices.getWatchListMovies(
        language: language,
        page: page,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
