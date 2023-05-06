import 'package:dartz/dartz.dart';
import 'package:untitled3/core/error/failure_request.dart';
import 'package:untitled3/data/data_sources/base_remote_data_sources.dart';
import 'package:untitled3/domain/entities/cast_entities.dart';
import 'package:untitled3/domain/entities/check_account_states.dart';
import 'package:untitled3/domain/entities/genre_entities.dart';
import 'package:untitled3/domain/entities/image_movie_entities.dart';
import 'package:untitled3/domain/entities/movie_entities.dart';
import 'package:untitled3/domain/entities/video_entities.dart';
import 'package:untitled3/domain/repository_domain/base_repository.dart';
import 'package:untitled3/domain/use_case/details_use_case/castmovie_usecase.dart';
import 'package:untitled3/domain/use_case/details_use_case/check_account_usecase.dart';
import 'package:untitled3/domain/use_case/details_use_case/detail_usecase.dart';
import 'package:untitled3/domain/use_case/details_use_case/imagemovie_uescase.dart';
import 'package:untitled3/domain/use_case/movies_use_case/moviebygenre_usecase.dart';
import 'package:untitled3/domain/use_case/search_usecase.dart';
import 'package:untitled3/domain/use_case/details_use_case/similar_usecase.dart';
import 'package:untitled3/domain/use_case/details_use_case/video_use_case.dart';

import '../../core/error/servier_exception.dart';

class RepositoryImpl extends BaseRepository
{
  final RemoteDataSources remoteDataSources;
  RepositoryImpl(this.remoteDataSources);
  @override
  Future<Either<Failure, List<MovieEntities>>> getPopularMovies()async {
    final result = await remoteDataSources.getPopularMovies();
    try{
      return Right(result);
    } on ServierException catch(failure){
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<GenreEntities>>> getGenreMovies()async {
    final result = await remoteDataSources.getGenreMovies();
    try{
      return Right(result);
    } on ServierException catch(failure){
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntities>>> getMoviesByGenres(GenreId parameter)async {
    final result = await remoteDataSources.getMoviesByGenres(parameter);
    try{
      return Right(result);
    } on ServierException catch(failure){
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntities>>> getTopRatedMovies() async{
    final result = await remoteDataSources.getTopRatedMovies();
    try{
      return Right(result);
    } on ServierException catch(failure){
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntities>>> getUpComingMovies()async {
    final result = await remoteDataSources.getUpComingMovies();
    try{
      return Right(result);
    } on ServierException catch(failure){
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntities>>> getTrendMovies()async {
    final result = await remoteDataSources.getTrendMovies();
    try{
      return Right(result);
    } on ServierException catch(failure){
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieEntities>> getDetailsMovies(int parameter)async {
    final result = await remoteDataSources.getDetailsMovies(parameter);
    try{
      return Right(result);
    } on ServierException catch(failure){
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<ImageMovieEntities>>> getImageMovies(ImageMovieId parameter)async {
    final result = await remoteDataSources.getImageMovies(parameter);
    try{
      return Right(result);
    } on ServierException catch(failure){
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<CastEntities>>> getCastMovies(CastMovieId parameter)async {
    final result = await remoteDataSources.getCastMovies(parameter);
    try{
      return Right(result);
    } on ServierException catch(failure){
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntities>>> getSimilarMovies(SimilarId parameter)async {
    final result = await remoteDataSources.getSimilarMovies(parameter);
    try{
      return Right(result);
    } on ServierException catch(failure){
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntities>>> getSearchMovies(SearchValue parameter)async {
    final result = await remoteDataSources.getSearchMovies(parameter);
    try{
      return Right(result);
    } on ServierException catch(failure){
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, CheckAccountStates>> getCheckAccountStates(int parameter)async {
    final result = await remoteDataSources.getCheckAccountStates(parameter);
    try{
      return Right(result);
    } on ServierException catch(failure){
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, String>> getVideoMovie(int parameter)async {
    final result = await remoteDataSources.getVideoMovies(parameter);
    try{
      return Right(result);
    } on ServierException catch(failure){
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }

}