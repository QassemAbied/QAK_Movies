import 'package:dartz/dartz.dart';
import '../../../core/base_usecase.dart';
import '../../../core/error/failure_request.dart';
import '../../entities/movie_entities.dart';
import '../../repository_domain/base_repository.dart';

class getDetailsMovieUseCase extends BaseUseCase<MovieEntities, int> {
  final BaseRepository baseRepository;
  getDetailsMovieUseCase(this.baseRepository);
  @override
  Future<Either<Failure, MovieEntities>> call(int parameter) async {
    return await baseRepository.getDetailsMovies(parameter);
  }
}

class DetailsId {
  final int id;
  DetailsId(this.id);
}
