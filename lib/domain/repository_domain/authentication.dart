import 'package:dartz/dartz.dart';
import 'package:untitled3/core/error/failure_request.dart';
import 'package:untitled3/domain/entities/login_entities.dart';
import 'package:untitled3/domain/entities/request_token_entities.dart';
import 'package:untitled3/domain/entities/session_entities.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, RequestTokenEntities>> getRequestToken();
  Future<Either<Failure, RequestTokenEntities>> getLoginValidate(
      LoginEntities parameter);
  Future<Either<Failure, SessionEntities>> getCreateSession(String parameter);
}
