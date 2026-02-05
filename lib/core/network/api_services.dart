import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:untitled3/core/network/api_constance.dart';
import 'package:untitled3/core/network/api_end_points.dart';
import 'package:untitled3/features/details_movies/data/models/credits_response.dart';
import 'package:untitled3/features/details_movies/data/models/images_movies_response.dart';
import 'package:untitled3/features/favorites/data/models/add_favorite_request.dart';
import 'package:untitled3/features/home/data/models/movies_genres_models.dart';
import 'package:untitled3/features/profile/data/models/profile_response.dart';
import 'package:untitled3/features/watch_list/data/models/add_watch_list_requst.dart';
import 'package:untitled3/features/watch_list/data/models/add_watch_list_response.dart';

import '../../features/details_movies/data/models/details_movies_response.dart';
import '../../features/details_movies/data/models/video_response.dart';
import '../../features/favorites/data/models/add_fav_response.dart';
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
  @GET(ApiEndPoints.trend)
  Future<MoviesResponse> getTrendMovies({
    @Query('page') required int page,
    @Query('language') required String language,
  });
  // @GET(ApiEndPoints.latest)
  // Future<MoviesResponse> getLatestMovies({
  //   @Query('page') required int page,
  //   @Query('language') required String language,
  // });
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
  @GET(ApiEndPoints.genreApi)
  Future<GenresMoviesModels> getGenresMovies({
    @Query('language') required String language,
  });

  @GET(ApiEndPoints.movieByGenre)
  Future<MoviesResponse> getMovieByGenre({
    @Query('with_genres') required int genreId,
    @Query('language') required String language,
  });
  @GET(ApiEndPoints.moviesDetails)
  Future<DetailsMoviesResponse> getMoviesDetails({
    @Path('movie_id') required int id,
    @Query('language') required String language,
  });
  @GET(ApiEndPoints.imageForMovie)
  Future<ImagesMoviesResponse> getImageForMovies({
    @Path('movie_id') required int id,
   // @Query('language') required String language,
  });
  @GET(ApiEndPoints.castForMovie)
  Future<CreditsResponse> getCastForMovies({
    @Path('movie_id') required int id,
    @Query('language') required String language,
  });
  @GET(ApiEndPoints.similarMovie)
  Future<MoviesResponse> getSimilarMovies({
    @Path('movie_id') required int id,
    @Query('language') required String language,
  });
  @GET(ApiEndPoints.moviesVideo)
  Future<VideoResponses> getVideoMovies({
    @Path('movie_id') required int id,
    @Query('language') required String language,
  });


  @POST(ApiEndPoints.addFavorites)
  Future<AddFavResponse> getAddFavorites({
   @Body() required  AddFavoriteRequest favoriteBody,
  //  @Query('language') required String language,
  });

  @GET(ApiEndPoints.favoritesMovies)
  Future<MoviesResponse> getFavoritesMovies({
    @Query('page') required int page,
    @Query('language') required String language,
  });

  @POST(ApiEndPoints.addWatchList)
  Future<AddWatchListResponse> getAddWatchList({
    @Body() required  AddWatchListRequest addWatchListRequest,
    //  @Query('language') required String language,
  });

  @GET(ApiEndPoints.watchList)
  Future<MoviesResponse> getWatchListMovies({
    @Query('page') required int page,
    @Query('language') required String language,
  });
  @GET(ApiEndPoints.searchMovies)
  Future<MoviesResponse> getSearchMovies({
    @Query('query') required String query,
    @Query('page') required int page,
    @Query('language') required String language,
  });
  @GET(ApiEndPoints.profile)
  Future<ProfileResponse> getProfile();
}
