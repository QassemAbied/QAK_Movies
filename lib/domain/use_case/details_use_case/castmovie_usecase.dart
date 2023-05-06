import 'package:dartz/dartz.dart';
import 'package:untitled3/domain/entities/cast_entities.dart';
import '../../../core/base_usecase.dart';
import '../../../core/error/failure_request.dart';
import '../../repository_domain/base_repository.dart';

class getCastMovieUseCase extends BaseUseCase<List<CastEntities>, CastMovieId> {
  final BaseRepository baseRepository;
  getCastMovieUseCase(this.baseRepository);
  @override
  Future<Either<Failure, List<CastEntities>>> call(
      CastMovieId parameter) async {
    return await baseRepository.getCastMovies(parameter);
  }
}

class CastMovieId {
  final int id;
  CastMovieId(this.id);
}
