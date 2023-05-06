import 'package:untitled3/domain/entities/check_account_states.dart';

class CheckAccountStatesModules extends CheckAccountStates {
  CheckAccountStatesModules(
      {required int id,
      required bool watchlist,
      required bool rated,
      required bool favorite})
      : super(id: id, watchlist: watchlist, rated: rated, favorite: favorite);

  factory CheckAccountStatesModules.fromJson(Map<String, dynamic> json) =>
      CheckAccountStatesModules(
          id: json['id'],
          watchlist: json['watchlist'],
          rated: json['rated'],
          favorite: json['favorite']);
}
