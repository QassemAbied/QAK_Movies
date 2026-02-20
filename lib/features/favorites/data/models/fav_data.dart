import '../../../home/data/models/movies_response_models.dart';

class FavData {
  final List<MovieModel> favoritesMovies;
  final bool hasMore;
  final Set<int> favId;

  FavData({required this.favoritesMovies,required this.hasMore, required this.favId});
}