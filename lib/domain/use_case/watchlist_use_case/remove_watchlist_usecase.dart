
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/base_usecase.dart';
import '../../../core/error/failure_request.dart';
import '../../entities/add_item_request_entities.dart';
import '../../entities/movie_entities.dart';
import '../../repository_domain/watchlist_repository.dart';

class getRemoveWatchListUseCase extends BaseUseCase<AddItemRequestEntities , MovieEntities>{
  final WatchListRepository watchListRepository;
  getRemoveWatchListUseCase(this.watchListRepository);
  @override
  Future<Either<Failure, AddItemRequestEntities>> call(MovieEntities parameter)async {
    return await watchListRepository.removeWatchListItem(parameter);
  }

}
