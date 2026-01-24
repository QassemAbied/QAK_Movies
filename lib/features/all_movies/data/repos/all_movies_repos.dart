import 'package:untitled3/core/network/api_result.dart';
import 'package:untitled3/features/home/data/models/movies_response_models.dart';

import '../../../home/data/models/movies_category.dart';

abstract class AllMoviesRepository {
  Future<ApiResult<MoviesResponse>> getAllMovies({
    required MovieCategory category,
    required int page,
    required String language,
  });
}
