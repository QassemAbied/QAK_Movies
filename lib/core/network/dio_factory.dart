import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:untitled3/core/network/api_constance.dart';

class DioFactory {
  DioFactory._();

 static Dio? _dio;
 static Dio getDio(){
   if (_dio != null) return _dio!;
   final timeOut = const Duration(seconds: 30);
 _dio=Dio(BaseOptions(
   connectTimeout: timeOut,
   receiveTimeout: timeOut,
   headers: {
     'Authorization': 'Bearer ${ApiConstance.BearerToken}',
     'accept': 'application/json',
   }
 ));
   _addInterceptors();
 return _dio!;
 }
  static void _addInterceptors(){
    if (kDebugMode) {
      _dio!.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
        ),
      );
    }
  }
}