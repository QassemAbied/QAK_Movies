import 'package:dartz/dartz.dart';
import 'package:untitled3/core/base_usecase.dart';
import 'package:untitled3/core/error/failure_request.dart';
import 'package:untitled3/domain/entities/movie_entities.dart';
import 'package:untitled3/domain/repository_domain/base_repository.dart';

class getPopularUseCase extends BaseUseCase<List<MovieEntities> , NoParameter>{
  final BaseRepository baseRepository;
   getPopularUseCase(this.baseRepository);
  @override
  Future<Either<Failure, List<MovieEntities>>> call(NoParameter parameter)async {
   return await baseRepository.getPopularMovies();
  }

}