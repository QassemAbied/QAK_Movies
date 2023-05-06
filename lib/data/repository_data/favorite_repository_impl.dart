import 'package:dartz/dartz.dart';
import 'package:untitled3/core/error/failure_request.dart';
import 'package:untitled3/data/data_sources/favorite_remote_data_source.dart';
import 'package:untitled3/domain/entities/movie_entities.dart';
import 'package:untitled3/domain/repository_domain/favorite_repository.dart';
import '../../core/error/servier_exception.dart';
import '../../domain/entities/add_item_request_entities.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteRemoteDataSource favoriteRemoteDataSource;
  FavoriteRepositoryImpl(this.favoriteRemoteDataSource);
  @override
  Future<Either<Failure, List<MovieEntities>>> getFavoriteMovie() async {
    final result = (await favoriteRemoteDataSource.getFavoriteMovie());
    try {
      return Right(result);
    } on ServierException catch (failure) {
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, AddItemRequestEntities>> getAddFavoriteMovie(
      MovieEntities parameter) async {
    final result = (await favoriteRemoteDataSource.addFavoriteItem(parameter));
    try {
      return Right(result);
    } on ServierException catch (failure) {
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, AddItemRequestEntities>> getRemovieFavoriteMovie(
      MovieEntities parameter) async {
    final result =
        (await favoriteRemoteDataSource.RemoveFavoriteItem(parameter));
    try {
      return Right(result);
    } on ServierException catch (failure) {
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }
}
