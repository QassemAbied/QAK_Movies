import '../../../home/data/models/movies_response_models.dart';

class WatchListData {
  final List<MovieModel> watchListMovies;
  final bool hasMore;
  final Set<int> watchId;
  WatchListData({required this.watchListMovies,required this.hasMore, required this.watchId});
}