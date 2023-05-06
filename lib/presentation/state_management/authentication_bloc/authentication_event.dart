import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable{

  @override
  List<Object> get props =>[];
}

class RequestTokenEvent extends AuthenticationEvent{}

class LoginValidateEvent extends AuthenticationEvent{
  final String name;
  final String password;
  final String token;

  LoginValidateEvent({required this.name , required this.password , required this.token});
  @override
  List<Object> get props =>[name , password , token];
}

class CreateSessionEvent extends AuthenticationEvent{
  final String requestToken;


  CreateSessionEvent({required this.requestToken , });
  @override
  List<Object> get props =>[requestToken];
}