import 'package:untitled3/data/modules/cast_movie_modules.dart';
import 'package:untitled3/data/modules/check_account_states_modules.dart';
import 'package:untitled3/data/modules/genre_module.dart';
import 'package:untitled3/data/modules/image_movie_module.dart';
import 'package:untitled3/data/modules/movie_modules.dart';
import 'package:untitled3/domain/use_case/details_use_case/castmovie_usecase.dart';
import 'package:untitled3/domain/use_case/details_use_case/imagemovie_uescase.dart';
import 'package:untitled3/domain/use_case/search_usecase.dart';
import 'package:untitled3/domain/use_case/details_use_case/similar_usecase.dart';
import '../../domain/use_case/movies_use_case/moviebygenre_usecase.dart';

abstract class RemoteDataSources {
  Future<List<MovieModules>> getPopularMovies();
  Future<List<GenreModules>> getGenreMovies();
  Future<List<MovieModules>> getMoviesByGenres(GenreId parameter);
  Future<List<MovieModules>> getTopRatedMovies();
  Future<List<MovieModules>> getUpComingMovies();
  Future<List<MovieModules>> getTrendMovies();
  Future<MovieModules> getDetailsMovies(int parameter);
  Future<List<ImageMovieModule>> getImageMovies(ImageMovieId parameter);
  Future<List<CastMovieModule>> getCastMovies(CastMovieId parameter);
  Future<List<MovieModules>> getSimilarMovies(SimilarId parameter);
  Future<List<MovieModules>> getSearchMovies(SearchValue parameter);
  Future<CheckAccountStatesModules> getCheckAccountStates(int parameter);
  Future<String> getVideoMovies(int parameter);
}
