import 'package:untitled3/domain/entities/genre_entities.dart';

class GenreModules extends GenreEntities {
  GenreModules({required String name, required int id})
      : super(name: name, id: id);
  factory GenreModules.fromJson(Map<String, dynamic> json) =>
      GenreModules(name: json['name'], id: json['id']);
}
