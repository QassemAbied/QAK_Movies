import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Failure extends Equatable{
  final String message ;
  //final int code ;
  const Failure(this.message , );

  @override
  List<Object?> get props => [message ];
}

class ServiceFailure extends Failure{
  ServiceFailure(String message) : super(message);

}