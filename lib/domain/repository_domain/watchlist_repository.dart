import 'package:dartz/dartz.dart';
import 'package:untitled3/core/error/failure_request.dart';
import 'package:untitled3/domain/entities/movie_entities.dart';
import '../entities/add_item_request_entities.dart';

abstract class WatchListRepository {
  Future<Either<Failure, List<MovieEntities>>> getWatchListItems();
  Future<Either<Failure, AddItemRequestEntities>> addWatchListItem(
      MovieEntities media);
  Future<Either<Failure, AddItemRequestEntities>> removeWatchListItem(
      MovieEntities media);
}
