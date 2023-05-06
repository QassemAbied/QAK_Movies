import 'package:dartz/dartz.dart';
import '../../../core/base_usecase.dart';
import '../../../core/error/failure_request.dart';
import '../../repository_domain/base_repository.dart';

class getVideoMovieUseCase extends BaseUseCase<String, int> {
  final BaseRepository baseRepository;
  getVideoMovieUseCase(this.baseRepository);
  @override
  Future<Either<Failure, String>> call(int parameter) async {
    return await baseRepository.getVideoMovie(parameter);
  }
}

class VideoId {
  final int id;
  VideoId(this.id);
}
