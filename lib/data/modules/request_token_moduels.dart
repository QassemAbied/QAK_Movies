import 'package:untitled3/domain/entities/request_token_entities.dart';

class RequestTokenModules extends RequestTokenEntities {
  RequestTokenModules(
      {required bool success,
      required String request_token,
      required String expires_at})
      : super(
            success: success,
            request_token: request_token,
            expires_at: expires_at);

  factory RequestTokenModules.fromJson(Map<String, dynamic> json) =>
      RequestTokenModules(
          success: json['success'],
          request_token: json['request_token'],
          expires_at: json['expires_at']);
}
