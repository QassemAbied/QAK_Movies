import 'package:dartz/dartz.dart';
import 'package:untitled3/domain/entities/cast_entities.dart';
import 'package:untitled3/domain/entities/check_account_states.dart';
import 'package:untitled3/domain/entities/genre_entities.dart';
import 'package:untitled3/domain/entities/image_movie_entities.dart';
import 'package:untitled3/domain/entities/movie_entities.dart';
import '../../core/error/failure_request.dart';
import '../entities/check_account_states.dart';
import '../use_case/details_use_case/castmovie_usecase.dart';
import '../use_case/details_use_case/imagemovie_uescase.dart';
import '../use_case/movies_use_case/moviebygenre_usecase.dart';
import '../use_case/search_usecase.dart';
import '../use_case/details_use_case/similar_usecase.dart';

abstract class BaseRepository {
  Future<Either<Failure, List<MovieEntities>>> getPopularMovies();
  Future<Either<Failure, List<GenreEntities>>> getGenreMovies();
  Future<Either<Failure, List<MovieEntities>>> getMoviesByGenres(
      GenreId parameter);
  Future<Either<Failure, List<MovieEntities>>> getTopRatedMovies();
  Future<Either<Failure, List<MovieEntities>>> getUpComingMovies();
  Future<Either<Failure, List<MovieEntities>>> getTrendMovies();
  Future<Either<Failure, MovieEntities>> getDetailsMovies(int id);
  Future<Either<Failure, List<ImageMovieEntities>>> getImageMovies(
      ImageMovieId parameter);
  Future<Either<Failure, List<CastEntities>>> getCastMovies(
      CastMovieId parameter);
  Future<Either<Failure, List<MovieEntities>>> getSimilarMovies(
      SimilarId parameter);
  Future<Either<Failure, List<MovieEntities>>> getSearchMovies(
      SearchValue parameter);
  Future<Either<Failure, CheckAccountStates>> getCheckAccountStates(
      int parameter);
  Future<Either<Failure, String>> getVideoMovie(int parameter);
}
