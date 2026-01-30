import 'package:untitled3/core/network/api_result.dart';
import 'package:untitled3/features/details_movies/data/models/details_movies_response.dart';
import 'package:untitled3/features/details_movies/data/models/video_response.dart';

import '../../../home/data/models/movies_response_models.dart';
import '../models/credits_response.dart';
import '../models/images_movies_response.dart';

abstract class DetailsMoviesRepository {
  Future<ApiResult<DetailsMoviesResponse>> getDetailsMovies({
    required String language,
    required int id,
});
  Future<ApiResult<CreditsResponse>> getCastForMovies({
    required String language,
    required int id,
  });
  Future<ApiResult<ImagesMoviesResponse>> getImageForMovies({
   // required String language,
    required int id,
  });
  Future<ApiResult<MoviesResponse>> getSimilarMovies({
    required String language,
    required int id,
  });
  Future<ApiResult<VideoResponses>> getVideoMovies({
    required String language,
    required int id,
  });
}