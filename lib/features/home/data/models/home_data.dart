import 'movies_response_models.dart';

class HomeData {
  final List<MovieModel> trend;
  final List<MovieModel> nowPlaying;
  final List<MovieModel> upcoming;
  final List<MovieModel> popular;
  final List<MovieModel> topRated;

  HomeData({
    required this.trend,
    required this.nowPlaying,
    required this.upcoming,
    required this.popular,
    required this.topRated,
  });
}
