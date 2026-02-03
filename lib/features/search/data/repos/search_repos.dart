import 'package:untitled3/core/network/api_result.dart';
import 'package:untitled3/features/home/data/models/movies_response_models.dart';

abstract class SearchRepos {
  Future<ApiResult<MoviesResponse>> getSearchMovies({
    required String query,
    required String language,
    required int page,
  });
}
