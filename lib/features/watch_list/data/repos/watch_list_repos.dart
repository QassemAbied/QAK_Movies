import 'package:untitled3/core/network/api_result.dart';
import 'package:untitled3/features/home/data/models/movies_response_models.dart';
import 'package:untitled3/features/watch_list/data/models/add_watch_list_requst.dart';
import 'package:untitled3/features/watch_list/data/models/add_watch_list_response.dart';

abstract class WatchListRepos {
  Future<ApiResult<AddWatchListResponse>> addWitchList({required AddWatchListRequest addWatchListRequest});
  Future<ApiResult<MoviesResponse>> getWatchListMovies({required String language , required int page});
}