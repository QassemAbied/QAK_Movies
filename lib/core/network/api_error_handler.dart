import 'dart:io';
import 'package:dio/dio.dart';
import 'package:untitled3/core/network/api_error_model.dart';



// class ApiErrorHandler {
//
//   static ApiErrorModel handle(dynamic error){
//     if(error is DioException){
//       switch(error.type){}
//     }else{
//
//     }
//   }
// }



class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      return _handleDioError(error);
    } else {
      return ApiErrorModel(
        message: 'Unexpected error occurred',
        code: -1,
        success: false,
      );
    }
  }

  static ApiErrorModel _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiErrorModel(
          message: 'Connection timeout',
          code: -1,
          success: false,
        );

      case DioExceptionType.sendTimeout:
        return ApiErrorModel(
          message: 'Send timeout',
          code: -2,
          success: false,
        );

      case DioExceptionType.receiveTimeout:
        return ApiErrorModel(
          message: 'Receive timeout',
          code: -3,
          success: false,
        );

      case DioExceptionType.badResponse:
        return _handleBadResponse(error);

      case DioExceptionType.cancel:
        return ApiErrorModel(
          message: 'Request was cancelled',
          code: -4,
          success: false,
        );

      case DioExceptionType.unknown:
        return _handleUnknownError(error);

      case DioExceptionType.connectionError:
        return ApiErrorModel(
          message: 'No internet connection',
          code: -6,
          success: false,
        );

      case DioExceptionType.badCertificate:
        return ApiErrorModel(
          message: 'Bad certificate',
          code: -7,
          success: false,
        );
    }
  }

  static ApiErrorModel _handleBadResponse(DioException error) {
    final data = error.response?.data;

    if (data is Map<String, dynamic>) {
      return ApiErrorModel(
        message: data['status_message'] ?? 'Server error',
        code: data['status_code'] ?? error.response?.statusCode,
        success: data['success'] ?? false,
      );
    }

    return ApiErrorModel(
      message: 'Server error',
      code: error.response?.statusCode,
      success: false,
    );
  }

  static ApiErrorModel _handleUnknownError(DioException error) {
    if (error.error is SocketException) {
      return ApiErrorModel(
        message: 'No internet connection',
        code: -6,
        success: false,
      );
    }

    return ApiErrorModel(
      message: 'Unexpected error occurred',
      code: -1,
      success: false,
    );
  }
}
