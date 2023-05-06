class ConstanceApi {
  static const String BaseUrl = 'https://api.themoviedb.org/3';
  static const String ApiKey = '9b5a0a5c81e919ba6c7e7e3faabcfd0f';
  static const String session_id = '4d2f951a29c2f051c736fd80be25f7086707b96e';
  static const String Create_session_id =
      'https://api.themoviedb.org/3/authentication/session/new?api_key=$ApiKey';
  static String imagePath(String path) =>
      'https://image.tmdb.org/t/p/w500$path';
  static const String PopularApi = '$BaseUrl/movie/popular?api_key=$ApiKey';
  static const String PlayingNow = '$BaseUrl/movie/now_playing?api_key=$ApiKey';
  static const String genreApi = '$BaseUrl/genre/movie/list?api_key=$ApiKey';
  static String movieByGenre(int GenreId) =>
      '$BaseUrl/discover/movie?with_genres=$GenreId&api_key=$ApiKey';
  static const String TopRated = '$BaseUrl/movie/top_rated?api_key=$ApiKey';
  static const String UpComing = '$BaseUrl/movie/upcoming?api_key=$ApiKey';
  static const String Latest = '$BaseUrl/movie/latest?api_key=$ApiKey';
  static const String Trend = '$BaseUrl/trending/movie/day?api_key=$ApiKey';
  static String DetailsMovie(int id) => '$BaseUrl/movie/$id?api_key=$ApiKey';
  static String ImageForMovie(int id) =>
      '$BaseUrl/movie/$id/images?api_key=$ApiKey';
  static String CastForMovie(int id) =>
      '$BaseUrl/movie/$id/credits?api_key=$ApiKey';
  static String ReviewForMovie(int id) =>
      '$BaseUrl/movie/$id/reviews?api_key=$ApiKey';
  static String SimilarMovie(int id) =>
      '$BaseUrl/movie/$id/similar?api_key=$ApiKey';
  static String SearchMovie(String value) =>
      '$BaseUrl/search/movie?api_key=$ApiKey&query=$value';
  static const String TokenRequest =
      '$BaseUrl/authentication/token/new?api_key=$ApiKey';
  static const String validateWithLogin =
      '$BaseUrl/authentication/token/validate_with_login?api_key=$ApiKey';
  static const String createSession =
      '$BaseUrl/authentication/session/new?api_key=$ApiKey';
  static const String WatchList =
      '$BaseUrl/account/15328661/watchlist/movies?api_key=$ApiKey&session_id=$session_id';
  static const String AddWatchLisrt =
      '$BaseUrl/account/15328661/watchlist?api_key=$ApiKey&session_id=$session_id';
  static const String RemoveWatchLisrt =
      '$BaseUrl/account/15328661/watchlist?api_key=$ApiKey&session_id=$session_id';

  static const String Favorites =
      '$BaseUrl/account/15328661/favorite/movies?api_key=$ApiKey&session_id=$session_id';
  static const String AddFavorites =
      '$BaseUrl/account/15328661/favorite?api_key=$ApiKey&session_id=$session_id';
  static const String RemoveFavorites =
      '$BaseUrl/account/15328661/favorite?api_key=$ApiKey&session_id=$session_id';

  static String CheckAccount(int id) =>
      '$BaseUrl/movie/$id/account_states?api_key=$ApiKey&session_id=$session_id';
  static String VideoMovie(int id) =>
      '$BaseUrl/movie/$id/videos?api_key=$ApiKey';

  static const String RequestToken =
      '$BaseUrl/authentication/token/new?api_key=$ApiKey';
  static const String LoginValidate =
      '$BaseUrl/authentication/token/validate_with_login?api_key=$ApiKey';
}
