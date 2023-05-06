import 'package:equatable/equatable.dart';

class SessionEntities extends Equatable{
  final bool success;
  final String session_id;
  SessionEntities({required this.success , required this.session_id});

  @override
  List<Object?> get props => [success , session_id];
}