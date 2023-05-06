import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled3/domain/entities/check_account_states.dart';

import '../../../core/base_usecase.dart';
import '../../../core/error/failure_request.dart';
import '../../repository_domain/base_repository.dart';

class getCheckAccountStatesUseCase extends BaseUseCase<CheckAccountStates , int>{
  final BaseRepository baseRepository;
  getCheckAccountStatesUseCase(this.baseRepository);
  @override
  Future<Either<Failure, CheckAccountStates>> call(int parameter)async {
    return await baseRepository.getCheckAccountStates(parameter);
  }

}

class AccountId extends Equatable{
  final int id ;
  final String Session;
  AccountId(this.id , this.Session);

  @override
  List<Object?> get props => [id , Session];
}