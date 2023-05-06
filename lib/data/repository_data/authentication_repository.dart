import 'package:dartz/dartz.dart';
import 'package:untitled3/core/error/failure_request.dart';
import 'package:untitled3/data/data_sources/authentication_remote_data_source.dart';
import 'package:untitled3/domain/entities/login_entities.dart';
import 'package:untitled3/domain/entities/request_token_entities.dart';
import 'package:untitled3/domain/entities/session_entities.dart';
import 'package:untitled3/domain/repository_domain/authentication.dart';
import '../../core/error/servier_exception.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource authenticationRemoteDataSource;
  AuthenticationRepositoryImpl(this.authenticationRemoteDataSource);
  @override
  Future<Either<Failure, RequestTokenEntities>> getRequestToken() async {
    final result = await authenticationRemoteDataSource.getRequestToken();

    try {
      return Right(result);
    } on ServierException catch (failure) {
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, RequestTokenEntities>> getLoginValidate(
      LoginEntities parameter) async {
    final result =
        await authenticationRemoteDataSource.getLoginValidate(parameter);

    try {
      return Right(result);
    } on ServierException catch (failure) {
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, SessionEntities>> getCreateSession(
      String parameter) async {
    final result =
        await authenticationRemoteDataSource.getCreateSession(parameter);

    try {
      return Right(result);
    } on ServierException catch (failure) {
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }
}
