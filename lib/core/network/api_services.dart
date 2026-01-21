import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:untitled3/core/network/api_constance.dart';

part 'api_services.g.dart';

@RestApi(baseUrl:ApiConstance.BaseUrl )
abstract class ApiServices {
 factory ApiServices(Dio dio ,{String baseUrl})= _ApiServices;


}