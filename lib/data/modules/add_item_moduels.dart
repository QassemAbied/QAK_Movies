import '../../domain/entities/add_item_request_entities.dart';

class AddItemRequestModules extends AddItemRequestEntities {
  AddItemRequestModules(
      {required int? id, required bool? isWatchList, required String? movie})
      : super(id: id, isWatchList: isWatchList, movie: movie);

  factory AddItemRequestModules.fromJson(Map<String, dynamic> json) =>
      AddItemRequestModules(
          id: json['id'],
          isWatchList: json['isWatchList'] != null ? json['isWatchList'] : true,
          movie: json['movie'] != null ? json['movie'] : 'movie');
}
