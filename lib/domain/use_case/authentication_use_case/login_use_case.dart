import 'package:dartz/dartz.dart';
import 'package:untitled3/domain/entities/login_entities.dart';
import '../../../core/base_usecase.dart';
import '../../../core/error/failure_request.dart';
import '../../entities/request_token_entities.dart';
import '../../repository_domain/authentication.dart';

class getLoginValidateUseCase
    extends BaseUseCase<RequestTokenEntities, LoginEntities> {
  final AuthenticationRepository authenticationRepository;
  getLoginValidateUseCase(this.authenticationRepository);
  @override
  Future<Either<Failure, RequestTokenEntities>> call(
      LoginEntities parameter) async {
    return await authenticationRepository.getLoginValidate(parameter);
  }
}
