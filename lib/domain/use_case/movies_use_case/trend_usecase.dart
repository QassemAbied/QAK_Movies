import 'package:dartz/dartz.dart';

import '../../../core/base_usecase.dart';
import '../../../core/error/failure_request.dart';
import '../../entities/movie_entities.dart';
import '../../repository_domain/base_repository.dart';

class getTrendUseCase extends BaseUseCase<List<MovieEntities> , NoParameter>{
  final BaseRepository baseRepository;
  getTrendUseCase(this.baseRepository);
  @override
  Future<Either<Failure, List<MovieEntities>>> call(NoParameter parameter)async {
    return await baseRepository.getTrendMovies();
  }

}