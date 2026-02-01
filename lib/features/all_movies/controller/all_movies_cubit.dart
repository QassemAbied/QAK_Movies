import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/network/api_result.dart';
import 'package:untitled3/features/all_movies/data/repos/all_movies_repos.dart';
import 'package:untitled3/features/home/data/models/movies_category.dart';
import 'package:untitled3/features/home/data/models/movies_response_models.dart';

import 'all_movies_state.dart';

class AllMoviesCubit extends Cubit<AllMoviesState> {
  final AllMoviesRepository allMoviesRepository;
  final MovieCategory category;
  final String language;
  AllMoviesCubit({required this.allMoviesRepository,
      required this.category, required this.language}) : super(const AllMoviesState.initial());
  int _page = 1;
  bool _isFetching = false;
  bool _hasMore = true;
  final List<MovieModel> _movies = [];


  Future<void> loadFirstPage() async {
    _page = 1;
    _hasMore = true;
    _movies.clear();
    await loadAllMovies();
  }

  Future<void> loadMore() async {
    if (_isFetching || !_hasMore) {
     // print('SKIP LOAD MORE | fetching=$_isFetching hasMore=$_hasMore');
      return;
    }
    //print('LOAD MORE PAGE $_page');
    await loadAllMovies();
  }
  Future<void> loadAllMovies() async{
    _isFetching = true;
    if (_page == 1) {
      emit(const AllMoviesState.loading());
    }

    final response=
    await allMoviesRepository.getAllMovies(
        category: category,
        page: _page,
        language: language
    );
    response.when(
        success: (moviesResponse){
          final newMovies = moviesResponse.results ?? [];
          _movies.addAll(newMovies);
          _hasMore = _page < (moviesResponse.totalPages ?? 0);
          _page++;

          emit(AllMoviesState.success(
              movies: List.from(_movies), hasMore: _hasMore));
        },
        failure: (error){
          emit(AllMoviesState.error(error: error));
        }
    );
    _isFetching = false;

  }
}
