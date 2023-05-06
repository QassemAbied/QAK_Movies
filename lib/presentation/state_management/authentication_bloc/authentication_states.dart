import 'package:equatable/equatable.dart';
import 'package:untitled3/domain/entities/request_token_entities.dart';
import '../../../core/enum.dart';
import '../../../domain/entities/session_entities.dart';

class AuthenticationStates extends Equatable {
  final RequestTokenEntities? requestToken;
  final EnumRequest enumRequesttoken;
  final String message;

  final RequestTokenEntities? login;
  final EnumRequest enumRequestlogin;
  final String messagelogin;

  final SessionEntities? session;
  final EnumRequest enumRequestsession;
  final String messagesession;
  AuthenticationStates({
    this.requestToken,
    this.enumRequesttoken = EnumRequest.loding,
    this.message = '',
    this.login,
    this.enumRequestlogin = EnumRequest.loding,
    this.messagelogin = '',
    this.session,
    this.enumRequestsession = EnumRequest.loding,
    this.messagesession = '',
  });

  AuthenticationStates copyWith({
    final RequestTokenEntities? requestToken,
    final EnumRequest? enumRequesttoken,
    final String? message,
    final RequestTokenEntities? login,
    final EnumRequest? enumRequestlogin,
    final String? messagelogin,
    final SessionEntities? session,
    final EnumRequest? enumRequestsession,
    final String? messagesession,
  }) {
    return AuthenticationStates(
      requestToken: requestToken ?? this.requestToken,
      enumRequesttoken: enumRequesttoken ?? this.enumRequesttoken,
      message: message ?? this.message,
      login: login ?? this.login,
      enumRequestlogin: enumRequestlogin ?? this.enumRequestlogin,
      messagelogin: messagelogin ?? this.messagelogin,
      session: session ?? this.session,
      enumRequestsession: enumRequestsession ?? this.enumRequestsession,
      messagesession: messagesession ?? this.messagesession,
    );
  }

  @override
  List<Object?> get props => [
        requestToken,
        enumRequesttoken,
        message,
        login,
        enumRequestlogin,
        messagelogin,
        session,
        enumRequestsession,
        messagesession,
      ];
}
