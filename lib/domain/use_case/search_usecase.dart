import 'package:dartz/dartz.dart';

import '../../core/base_usecase.dart';
import '../../core/error/failure_request.dart';
import '../entities/movie_entities.dart';
import '../repository_domain/base_repository.dart';

class getSearchMovieUseCase extends BaseUseCase<List<MovieEntities> , SearchValue>{
  final BaseRepository baseRepository;
  getSearchMovieUseCase(this.baseRepository);
  @override
  Future<Either<Failure, List<MovieEntities>>> call(SearchValue parameter)async {
    return await baseRepository.getSearchMovies(parameter);
  }

}

class SearchValue{
  final String value ;
  SearchValue(this.value);
}