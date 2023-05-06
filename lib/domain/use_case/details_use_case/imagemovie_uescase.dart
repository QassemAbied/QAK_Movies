import 'package:dartz/dartz.dart';
import 'package:untitled3/domain/entities/image_movie_entities.dart';
import '../../../core/base_usecase.dart';
import '../../../core/error/failure_request.dart';
import '../../repository_domain/base_repository.dart';

class getImageMovieUseCase
    extends BaseUseCase<List<ImageMovieEntities>, ImageMovieId> {
  final BaseRepository baseRepository;
  getImageMovieUseCase(this.baseRepository);
  @override
  Future<Either<Failure, List<ImageMovieEntities>>> call(
      ImageMovieId parameter) async {
    return await baseRepository.getImageMovies(parameter);
  }
}

class ImageMovieId {
  final int id;
  ImageMovieId(this.id);
}
