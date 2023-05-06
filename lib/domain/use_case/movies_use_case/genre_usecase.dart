import 'package:dartz/dartz.dart';
import 'package:untitled3/domain/entities/genre_entities.dart';

import '../../../core/base_usecase.dart';
import '../../../core/error/failure_request.dart';
import '../../repository_domain/base_repository.dart';

class getGenreUseCase extends BaseUseCase<List<GenreEntities> , NoParameter>{
  final BaseRepository baseRepository;
  getGenreUseCase(this.baseRepository);
  @override
  Future<Either<Failure, List<GenreEntities>>> call(NoParameter parameter)async {
    return await baseRepository.getGenreMovies();
  }

}