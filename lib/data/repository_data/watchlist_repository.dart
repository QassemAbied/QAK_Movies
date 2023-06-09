import 'package:dartz/dartz.dart';
import 'package:untitled3/data/data_sources/watchlist_remote_data_source.dart';
import 'package:untitled3/domain/entities/movie_entities.dart';
import '../../core/error/failure_request.dart';
import '../../core/error/servier_exception.dart';
import '../../domain/entities/add_item_request_entities.dart';
import '../../domain/repository_domain/watchlist_repository.dart';

class WatchListRepositoryImpl implements WatchListRepository {
  final WatchlistLocalDataSource watchlistLocalDataSource;
  WatchListRepositoryImpl(this.watchlistLocalDataSource);

  @override
  Future<Either<Failure, List<MovieEntities>>> getWatchListItems() async {
    final result = (await watchlistLocalDataSource.getWatchListItems());
    try {
      return Right(result);
    } on ServierException catch (failure) {
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, AddItemRequestEntities>> addWatchListItem(
      MovieEntities media) async {
    final result = (await watchlistLocalDataSource.addWatchListItem(media));
    try {
      return Right(result);
    } on ServierException catch (failure) {
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, AddItemRequestEntities>> removeWatchListItem(
      MovieEntities media) async {
    final result = (await watchlistLocalDataSource.removeWatchListItem(media));
    try {
      return Right(result);
    } on ServierException catch (failure) {
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }

  // final result = (await watchlistLocalDataSource.removeWatchListItem(index));
  // try {
  // return Right(Unit);
  // } on ServierException catch (failure) {
  // return Left(ServiceFailure(failure.errorHandle.statusMessage));
  // }
}
