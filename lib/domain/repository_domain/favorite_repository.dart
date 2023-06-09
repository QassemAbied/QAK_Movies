import 'package:dartz/dartz.dart';
import 'package:untitled3/core/error/failure_request.dart';
import 'package:untitled3/domain/entities/movie_entities.dart';

import '../entities/add_item_request_entities.dart';

abstract class FavoriteRepository {
  Future<Either<Failure, List<MovieEntities>>> getFavoriteMovie();
  Future<Either<Failure, AddItemRequestEntities>> getAddFavoriteMovie(
      MovieEntities parameter);
  Future<Either<Failure, AddItemRequestEntities>> getRemovieFavoriteMovie(
      MovieEntities parameter);
}
