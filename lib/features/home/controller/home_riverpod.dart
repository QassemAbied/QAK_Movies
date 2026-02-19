import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled3/core/network/api_result.dart';
import '../../providers.dart';
import '../data/models/home_data.dart';
import '../data/models/movies_category.dart';
import '../data/repos/movies_repos.dart';

class HomeNotifier extends FamilyAsyncNotifier<HomeData,String>{
  MoviesRepository get _repos=> ref.read(homeReposProvider);
  late final String _language;
  @override
  Future<HomeData> build( String language, ) async{
    _language = language;
 return  await getHome();

  }
  Future getHome()async{
    final results = await Future.wait([
      _repos.getMoviesByCategory(
        category: MovieCategory.trend,
        page: 1,
        language: _language,
      ),
      _repos.getMoviesByCategory(
        category: MovieCategory.nowPlaying,
        page: 1,
        language: _language,
      ),
      _repos.getMoviesByCategory(
        category: MovieCategory.upcoming,
        page: 1,
        language: _language,
      ),
      _repos.getMoviesByCategory(
        category: MovieCategory.popular,
        page: 1,
        language: _language,
      ),
      _repos.getMoviesByCategory(
        category: MovieCategory.topRated,
        page: 1,
        language: _language,
      ),
    ],);
    String? error;

    for (final result in results) {
      result.whenOrNull(
        failure: (e) => error ??= e.message,
      );
    }

    if (error != null) {
      throw Exception(error);
    }

    return HomeData(
      trend: (results[0] as Success).data.results ?? [],
      nowPlaying: (results[1] as Success).data.results ?? [],
      upcoming: (results[2] as Success).data.results ?? [],
      popular: (results[3] as Success).data.results ?? [],
      topRated: (results[4] as Success).data.results ?? [],
    );
  }
}