import 'package:dartz/dartz.dart';
import '../../../core/base_usecase.dart';
import '../../../core/error/failure_request.dart';
import '../../entities/add_item_request_entities.dart';
import '../../entities/movie_entities.dart';
import '../../repository_domain/favorite_repository.dart';

class getRemoveFavoriteUseCase
    extends BaseUseCase<AddItemRequestEntities, MovieEntities> {
  final FavoriteRepository favoriteRepository;
  getRemoveFavoriteUseCase(this.favoriteRepository);
  @override
  Future<Either<Failure, AddItemRequestEntities>> call(
      MovieEntities parameter) async {
    return await favoriteRepository.getRemovieFavoriteMovie(parameter);
  }
}
