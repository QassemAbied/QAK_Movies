import 'package:equatable/equatable.dart';

class AddItemRequestEntities extends Equatable {
  int? id;
  String? movie;
  bool? isWatchList;

  AddItemRequestEntities(
      {required this.id, required this.isWatchList, required this.movie});
  @override
  List<Object?> get props => [id, isWatchList, movie];
}
