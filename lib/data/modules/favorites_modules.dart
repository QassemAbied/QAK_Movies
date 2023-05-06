import 'package:untitled3/data/modules/movie_modules.dart';
import 'package:untitled3/domain/entities/favorites_entities.dart';
import 'package:untitled3/domain/entities/movie_entities.dart';

class FavoritesModules extends FavoritesEntities {
  FavoritesModules(
      {required int page,
      required List<MovieEntities> results,
      required int total_pages,
      required int total_results})
      : super(
            page: page,
            results: results,
            total_pages: total_pages,
            total_results: total_results);

  factory FavoritesModules.fromJson(Map<String, dynamic> json) =>
      FavoritesModules(
          page: json['page'],
          results: List<MovieModules>.from(json['results']),
          total_pages: json['total_pages'],
          total_results: json['total_results']);
}
