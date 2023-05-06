import 'package:dartz/dartz.dart';
import 'package:untitled3/domain/entities/session_entities.dart';

import '../../../core/base_usecase.dart';
import '../../../core/error/failure_request.dart';
import '../../repository_domain/authentication.dart';

class getCreateSessionUseCase extends BaseUseCase<SessionEntities , String>{
  final AuthenticationRepository authenticationRepository;
  getCreateSessionUseCase(this.authenticationRepository);
  @override
  Future<Either<Failure, SessionEntities>> call(String parameter) async{
    return  await authenticationRepository.getCreateSession(parameter);
  }

}