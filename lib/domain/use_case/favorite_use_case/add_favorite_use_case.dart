import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled3/domain/repository_domain/favorite_repository.dart';

import '../../../core/base_usecase.dart';
import '../../../core/error/failure_request.dart';
import '../../entities/add_item_request_entities.dart';
import '../../entities/movie_entities.dart';
import '../watchlist_use_case/add_watchlist_usecase.dart';

class getAddFavoriteUseCase extends BaseUseCase<AddItemRequestEntities , MovieEntities>{
  final FavoriteRepository favoriteRepository;
  getAddFavoriteUseCase(this.favoriteRepository);
  @override
  Future<Either<Failure, AddItemRequestEntities>> call(MovieEntities parameter)async {
    return await favoriteRepository.getAddFavoriteMovie(parameter);
  }

}
// class AddItemRequest extends Equatable{
//   int? id;
//   String? movie;
//   bool? isWatchList;
//
//   AddItemRequest({required this.id,required this.isWatchList,required this.movie});
//   @override
//   List<Object?> get props => [id, isWatchList , movie];
//
// }
