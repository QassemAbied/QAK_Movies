import 'package:equatable/equatable.dart';

class TokenEntities extends Equatable{
  final bool success;
  final String expires_at;
  final String request_token;
  TokenEntities({required this.success , required this.expires_at , required this.request_token});

  @override
  List<Object?> get props => [success , expires_at , request_token];
}