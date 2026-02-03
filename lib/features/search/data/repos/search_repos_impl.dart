import 'package:untitled3/core/network/api_error_model.dart';
import 'package:untitled3/core/network/api_result.dart';
import 'package:untitled3/core/network/api_services.dart';
import 'package:untitled3/features/home/data/models/movies_response_models.dart';
import 'package:untitled3/features/search/data/repos/search_repos.dart';

import '../../../../core/network/api_error_handler.dart';

class SearchReposImpl implements SearchRepos {
  final ApiServices _apiServices;
  SearchReposImpl(this._apiServices);

  @override
  Future<ApiResult<MoviesResponse>> getSearchMovies({
    required String query,
    required String language,
    required int page,
  }) async {
    try {
      final response = await _apiServices.getSearchMovies(
        query: query,
        page: page,
        language: language,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
