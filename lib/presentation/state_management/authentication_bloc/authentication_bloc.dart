import 'package:bloc/bloc.dart';
import 'package:untitled3/core/base_usecase.dart';
import 'package:untitled3/core/enum.dart';
import 'package:untitled3/domain/entities/login_entities.dart';
import 'package:untitled3/domain/use_case/authentication_use_case/create_session_use_case.dart';
import 'package:untitled3/domain/use_case/authentication_use_case/login_use_case.dart';
import 'package:untitled3/domain/use_case/authentication_use_case/request_token_use_case.dart';
import 'package:untitled3/presentation/state_management/authentication_bloc/authentication_event.dart';
import 'package:untitled3/presentation/state_management/authentication_bloc/authentication_states.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationStates  >{
  final RequestTokenUseCase requestTokenUseCase;
  final getLoginValidateUseCase loginValidateUseCase;
  final getCreateSessionUseCase createSessionUseCase;

  AuthenticationBloc(this.requestTokenUseCase,
      this.loginValidateUseCase,
      this.createSessionUseCase
      ) : super(AuthenticationStates()){

    on<RequestTokenEvent>((event, emit)async {
      final result = await requestTokenUseCase.call(NoParameter());
      result.fold((l) {
        emit(state.copyWith(enumRequesttoken: EnumRequest.error , message: l.message));
      }, (r) {
        emit(state.copyWith(requestToken: r , enumRequesttoken: EnumRequest.loded));
      });
    });


    on<LoginValidateEvent>((event, emit)async {
      final result = await loginValidateUseCase.call(LoginEntities(
          username: event.name,
          password: event.password,
          request_token: event.token,
      ));
      print(state);

      result.fold((l) {
        emit(state.copyWith(enumRequestlogin: EnumRequest.error , messagelogin: l.message));
      }, (r) {
        emit(state.copyWith(login: r , enumRequestlogin: EnumRequest.loded));
      });
    });


    on<CreateSessionEvent>((event, emit)async {
      final result = await createSessionUseCase.call(event.requestToken);
      print(state);
      result.fold((l) {
        emit(state.copyWith(enumRequestsession: EnumRequest.error , messagesession: l.message));
      }, (r) {
        emit(state.copyWith(session: r , enumRequestsession: EnumRequest.loded));
      });
    });
  }




}