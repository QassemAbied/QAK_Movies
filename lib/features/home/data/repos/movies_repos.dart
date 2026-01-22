import '../../../../core/network/api_result.dart';
import '../models/movies_category.dart';
import '../models/movies_response_models.dart';

abstract class MoviesRepository {
  Future<ApiResult<MoviesResponse>> getMoviesByCategory({
    required MovieCategory category,
    required int page,
    required String language,
  });
}
