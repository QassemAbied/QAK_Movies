import 'package:untitled3/domain/entities/login_entities.dart';

class LoginModules extends LoginEntities{
  LoginModules({required String username, required String password,
    required String request_token}) : super(username: username, password: password,
      request_token: request_token);

  factory LoginModules.fromJson(Map<String , dynamic> json)=>
      LoginModules(
          username: json['username'],
          password: json['password'],
          request_token: json['request_token']
      );

}