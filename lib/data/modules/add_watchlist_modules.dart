import 'package:untitled3/domain/entities/add_watchlist_entities.dart';

class AddWatchListModules extends AddWatchList{
  AddWatchListModules({required bool success, required int status_code,
    required String status_message}) : super(success: success, status_code: status_code,
      status_message: status_message);

  factory AddWatchListModules.fromJson(Map<String , dynamic> json)=>
      AddWatchListModules(
          success: json['success'],
          status_code: json['status_code'],
          status_message: json['status_message']
      );

}