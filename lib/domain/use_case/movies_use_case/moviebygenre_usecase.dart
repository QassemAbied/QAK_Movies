import 'package:dartz/dartz.dart';
import '../../../core/base_usecase.dart';
import '../../../core/error/failure_request.dart';
import '../../entities/movie_entities.dart';
import '../../repository_domain/base_repository.dart';

class getMovieByGenresUseCase
    extends BaseUseCase<List<MovieEntities>, GenreId> {
  final BaseRepository baseRepository;
  getMovieByGenresUseCase(this.baseRepository);
  @override
  Future<Either<Failure, List<MovieEntities>>> call(GenreId parameter) async {
    return await baseRepository.getMoviesByGenres(parameter);
  }
}

class GenreId {
  final int id;
  GenreId(this.id);
}
