import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled3/core/network/api_result.dart';
import 'package:untitled3/features/all_movies/data/models/all_movies_data.dart';
import 'package:untitled3/features/all_movies/data/models/all_movies_params.dart';
import 'package:untitled3/features/all_movies/data/repos/all_movies_repos.dart';
import 'package:untitled3/features/home/data/models/movies_category.dart';
import 'package:untitled3/features/home/data/models/movies_response_models.dart';
import 'package:untitled3/features/providers.dart';
class AllMoviesNotifier
    extends FamilyAsyncNotifier<AllMoviesData, AllMoviesParams> {

  AllMoviesRepository get _repos => ref.read(allMoviesRepoProvider);

  late String _language;
  late MovieCategory _category;

  int _page = 1;
  bool _hasMore = true;
  bool _isFetching = false;

  final List<MovieModel> _movies = [];

  @override
  Future<AllMoviesData> build(AllMoviesParams arg) async {
    _language = arg.language;
    _category = arg.movieCategory;

    ref.keepAlive();

    return _fetchFirstPage();
  }

  Future<AllMoviesData> _fetchFirstPage() async {
    _page = 1;
    _hasMore = true;
    _movies.clear();

    return _fetchMovies();
  }

  Future<void> loadMore() async {
    if (_isFetching || !_hasMore) return;

    _isFetching = true;

    try {
      final data = await _fetchMovies();

      state = AsyncData(data);
    } catch (e, st) {
      state = AsyncError(e, st);
    }

    _isFetching = false;
  }
  Future<AllMoviesData> _fetchMovies() async {
    final response = await _repos.getAllMovies(
      category: _category,
      page: _page,
      language: _language,
    );

    return response.when(
      success: (data) {
        final newList = data.results ?? [];

        _movies.addAll(newList);

        _hasMore = _page < (data.totalPages ?? 0);
        _page++;

        return AllMoviesData(List.of(_movies), _hasMore);
      },
      failure: (error) => throw Exception(error.message),
    );
  }
}
