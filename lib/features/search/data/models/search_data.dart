import '../../../home/data/models/movies_response_models.dart';

class SearchData {
  final List<MovieModel> results;

  final bool hasMore;

  SearchData({
    required this.results,
    required this.hasMore,
  });

  // SearchData copyWith({
  //   MoviesResponse? results,
  //   bool? hasMore,
  // }) {
  //   return SearchData(
  //     results: results ?? [],
  //     hasMore: hasMore ?? this.hasMore,
  //   );
  // }
}
