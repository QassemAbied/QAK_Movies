import 'api_constance.dart';

class ApiEndPoints {

  static const String profile = '/account/15328661';
  static const String popularApi = '/movie/popular';
  static const String playingNow = '/movie/now_playing';
  static const String genreApi = '/genre/movie/list';
  static const String movieByGenre = '/discover/movie';
  static const String topRated = '/movie/top_rated';
  static const String upComing = '/movie/upcoming';
  static const String latest = '/movie/latest';
  static const String trend = '/trending/movie/day';
  static const String moviesDetails = '/movie/{movie_id}';
  static const String moviesVideo = '/movie/{movie_id}/videos';
  static const String imageForMovie = '/movie/{movie_id}/images';
  static const String castForMovie = '/movie/{movie_id}/credits';
  static const String reviewForMovie = '/movie/{movie_id}/reviews';
  static const String similarMovie ='/movie/{movie_id}/similar';
  static const String searchMovies = '/search/movie';
  static const String TokenRequest =
      '${ApiConstance.BaseUrl}/authentication/token/new';
  static const String validateWithLogin =
      '${ApiConstance.BaseUrl}/authentication/token/validate_with_login';
  static const String createSession =
      '${ApiConstance.BaseUrl}/authentication/session/new';
  static const String watchList = '/account/15328661/watchlist/movies';
  static const String addWatchList = '/account/15328661/watchlist';
  static const String favoritesMovies = '/account/15328661/favorite/movies';
  static const String addFavorites = '/account/15328661/favorite';





}
