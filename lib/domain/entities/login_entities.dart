import 'package:equatable/equatable.dart';

class LoginEntities extends Equatable{
  final String username;
  final String password;
  final String request_token;
  LoginEntities({required this.username , required this.password , required this.request_token});

  @override
  List<Object?> get props => [username , password , request_token];

}