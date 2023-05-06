import 'package:dartz/dartz.dart';
import 'package:untitled3/domain/repository_domain/watchlist_repository.dart';
import '../../../core/base_usecase.dart';
import '../../../core/error/failure_request.dart';
import '../../entities/movie_entities.dart';
import '../../repository_domain/base_repository.dart';

class getWatchListUseCase
    extends BaseUseCase<List<MovieEntities>, NoParameter> {
  final WatchListRepository watchListRepository;
  getWatchListUseCase(this.watchListRepository);
  @override
  Future<Either<Failure, List<MovieEntities>>> call(
      NoParameter parameter) async {
    return await watchListRepository.getWatchListItems();
  }
}
