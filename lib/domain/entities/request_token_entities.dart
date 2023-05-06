import 'package:equatable/equatable.dart';

class RequestTokenEntities extends Equatable {
  final bool success;
  final String expires_at;
  final String request_token;
  const RequestTokenEntities(
      {required this.success,
      required this.request_token,
      required this.expires_at});

  @override
  List<Object?> get props => [success, expires_at, request_token];
}
