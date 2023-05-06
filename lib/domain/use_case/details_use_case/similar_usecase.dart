import 'package:dartz/dartz.dart';
import '../../../core/base_usecase.dart';
import '../../../core/error/failure_request.dart';
import '../../entities/movie_entities.dart';
import '../../repository_domain/base_repository.dart';

class getSimilarMovieUseCase
    extends BaseUseCase<List<MovieEntities>, SimilarId> {
  final BaseRepository baseRepository;
  getSimilarMovieUseCase(this.baseRepository);
  @override
  Future<Either<Failure, List<MovieEntities>>> call(SimilarId parameter) async {
    return await baseRepository.getSimilarMovies(parameter);
  }
}

class SimilarId {
  final int id;
  SimilarId(this.id);
}
