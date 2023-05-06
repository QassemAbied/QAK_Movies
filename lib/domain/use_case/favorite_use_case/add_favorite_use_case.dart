import 'package:dartz/dartz.dart';
import 'package:untitled3/domain/repository_domain/favorite_repository.dart';
import '../../../core/base_usecase.dart';
import '../../../core/error/failure_request.dart';
import '../../entities/add_item_request_entities.dart';
import '../../entities/movie_entities.dart';

class getAddFavoriteUseCase
    extends BaseUseCase<AddItemRequestEntities, MovieEntities> {
  final FavoriteRepository favoriteRepository;
  getAddFavoriteUseCase(this.favoriteRepository);
  @override
  Future<Either<Failure, AddItemRequestEntities>> call(
      MovieEntities parameter) async {
    return await favoriteRepository.getAddFavoriteMovie(parameter);
  }
}
