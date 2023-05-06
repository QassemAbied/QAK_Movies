import 'package:dio/dio.dart';
import 'package:untitled3/data/modules/login_modules.dart';
import 'package:untitled3/data/modules/request_token_moduels.dart';

import '../../core/api.dart';
import '../../core/error/error_handle.dart';
import '../../core/error/servier_exception.dart';
import '../../domain/entities/login_entities.dart';
import '../modules/session_moduels.dart';

abstract class AuthenticationRemoteDataSource {
  Future<RequestTokenModules> getRequestToken();
  Future<RequestTokenModules> getLoginValidate(LoginEntities parameter);
  Future<SessionModules> getCreateSession(String parameter);

}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  @override
  Future<RequestTokenModules> getRequestToken() async {
    final response = await Dio().get(ConstanceApi.RequestToken);

    if (response.statusCode == 200) {
      return RequestTokenModules.fromJson(response.data);
    }
    {
      throw ServierException(ErrorHandleApi.fromJson(response.data));
    }
  }

  @override
  Future<RequestTokenModules> getLoginValidate(LoginEntities parameter)async {
    final response = await Dio().postUri(Uri.parse(ConstanceApi.LoginValidate,

    ),
      data: {

        'username': parameter.username,
        'password': parameter.password,
        'request_token': parameter.request_token,
      },
      options: Options(
          headers: {
            'Content-Type': 'application/json;charset=utf-8',
          }
      ),
    );

   // return RequestTokenModules.fromJson(response.data);

    if(response.statusCode ==200){
     return RequestTokenModules.fromJson(response.data);
   }else{
     throw ServierException(ErrorHandleApi.fromJson(response.data));

   }
  }

  @override
  Future<SessionModules> getCreateSession(String parameter)async {
    final response= await Dio().post(
      ConstanceApi.session_id ,
      data: {
        'request_token': parameter,

      },
      options: Options(
          headers: {
            'Content-Type': 'application/json;charset=utf-8',
          }
      ),
    );
    print(response);


    if(response.statusCode ==200){
      return SessionModules.fromJson(response.data);
    }else{
      throw ServierException(ErrorHandleApi.fromJson(response.data));

    }
  }
}
