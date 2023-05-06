import 'package:equatable/equatable.dart';
import 'package:untitled3/domain/entities/movie_entities.dart';

class FavoritesEntities extends Equatable {
  final int page;
  final List<MovieEntities> results;
  final int total_pages;
  final int total_results;

  FavoritesEntities(
      {required this.page,
      required this.results,
      required this.total_pages,
      required this.total_results});
  @override
  List<Object?> get props => [page, results, total_results, total_pages];
}
