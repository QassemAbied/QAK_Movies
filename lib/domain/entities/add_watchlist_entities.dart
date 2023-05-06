import 'package:equatable/equatable.dart';

class AddWatchList extends Equatable {
  final bool success;
  final int status_code;
  final String status_message;
  AddWatchList(
      {required this.success,
      required this.status_code,
      required this.status_message});

  @override
  List<Object?> get props => [status_message, status_code, success];
}
