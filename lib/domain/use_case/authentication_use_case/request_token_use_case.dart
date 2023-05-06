import 'package:dartz/dartz.dart';
import 'package:untitled3/core/base_usecase.dart';
import 'package:untitled3/core/error/failure_request.dart';
import 'package:untitled3/domain/entities/request_token_entities.dart';
import 'package:untitled3/domain/repository_domain/authentication.dart';

class RequestTokenUseCase
    extends BaseUseCase<RequestTokenEntities, NoParameter> {
  final AuthenticationRepository authenticationRepository;
  RequestTokenUseCase(this.authenticationRepository);
  @override
  Future<Either<Failure, RequestTokenEntities>> call(
      NoParameter parameter) async {
    return await authenticationRepository.getRequestToken();
  }
}
