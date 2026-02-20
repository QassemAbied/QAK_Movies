import '../../../home/data/models/movies_response_models.dart';

class AllMoviesData {
  final List<MovieModel> movies;
  final bool hasMore;

  AllMoviesData(this.movies, this.hasMore);
}