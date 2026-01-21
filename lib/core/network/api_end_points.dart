 import 'api_constance.dart';

class ApiEndPoints {
   static const String session_id = '4d2f951a29c2f051c736fd80be25f7086707b96e';
   static const String Create_session_id =
       'https://api.themoviedb.org/3/authentication/session/new';

   static const String PopularApi = '${ApiEndPoint.BaseUrl}/movie/popular';
   static const String PlayingNow = '${ApiEndPoint.BaseUrl}/movie/now_playing';
   static const String genreApi = '${ApiEndPoint.BaseUrl}/genre/movie/list';
   static String movieByGenre(int GenreId) =>
       '${ApiEndPoint.BaseUrl}/discover/movie?with_genres=$GenreId';
   static const String TopRated = '${ApiEndPoint.BaseUrl}/movie/top_rated';
   static const String UpComing = '${ApiEndPoint.BaseUrl}/movie/upcoming';
   static const String Latest = '${ApiEndPoint.BaseUrl}/movie/latest';
   static const String Trend = '${ApiEndPoint.BaseUrl}/trending/movie/day';
   static String DetailsMovie(int id) => '${ApiEndPoint.BaseUrl}/movie/$id';
   static String ImageForMovie(int id) =>
       '${ApiEndPoint.BaseUrl}/movie/$id/images';
   static String CastForMovie(int id) =>
       '${ApiEndPoint.BaseUrl}/movie/$id/credits';
   static String ReviewForMovie(int id) =>
       '${ApiEndPoint.BaseUrl}/movie/$id/reviews';
   static String SimilarMovie(int id) =>
       '${ApiEndPoint.BaseUrl}/movie/$id/similar';
   static String SearchMovie(String value) =>
       '${ApiEndPoint.BaseUrl}/search/movie&query=$value';
   static const String TokenRequest =
       '${ApiEndPoint.BaseUrl}/authentication/token/new';
   static const String validateWithLogin =
       '${ApiEndPoint.BaseUrl}/authentication/token/validate_with_login';
   static const String createSession =
       '${ApiEndPoint.BaseUrl}/authentication/session/new';
   static const String WatchList =
       '${ApiEndPoint.BaseUrl}/account/15328661/watchlist/movies&session_id=$session_id';
   static const String AddWatchLisrt =
       '${ApiEndPoint.BaseUrl}/account/15328661/watchlist&session_id=$session_id';
   static const String RemoveWatchLisrt =
       '${ApiEndPoint.BaseUrl}/account/15328661/watchlist&session_id=$session_id';

   static const String Favorites =
       '${ApiEndPoint.BaseUrl}/account/15328661/favorite/movies&session_id=$session_id';
   static const String AddFavorites =
       '${ApiEndPoint.BaseUrl}/account/15328661/favorite&session_id=$session_id';
   static const String RemoveFavorites =
       '${ApiEndPoint.BaseUrl}/account/15328661/favorite&session_id=$session_id';

   static String CheckAccount(int id) =>
       '${ApiEndPoint.BaseUrl}/movie/$id/account_states&session_id=$session_id';
   static String VideoMovie(int id) =>
       '${ApiEndPoint.BaseUrl}/movie/$id/videos';

   static const String RequestToken =
       '${ApiEndPoint.BaseUrl}/authentication/token/new';
   static const String LoginValidate =
       '${ApiEndPoint.BaseUrl}/authentication/token/validate_with_login';

 }