import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:untitled3/core/network/api_constance.dart';
import 'package:untitled3/core/network/api_end_points.dart';

import '../../features/home/data/models/movies_response_models.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstance.BaseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @GET(ApiEndPoints.popularApi)
  Future<MoviesResponse> getPopularMovies({
    @Query('page') required int page,
    @Query('language') required String language,
  });
  @GET(ApiEndPoints.playingNow)
  Future<MoviesResponse> getPlayingNowMovies({
    @Query('page') required int page,
    @Query('language') required String language,
  });
  @GET(ApiEndPoints.topRated)
  Future<MoviesResponse> getTopRatedMovies({
    @Query('page') required int page,
    @Query('language') required String language,
  });
  @GET(ApiEndPoints.upComing)
  Future<MoviesResponse> getUpComingMovies({
    @Query('page') required int page,
    @Query('language') required String language,
  });
}
