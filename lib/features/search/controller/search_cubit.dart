

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/network/api_result.dart';
import 'package:untitled3/features/search/controller/search_state.dart';
import 'package:untitled3/features/search/data/repos/search_repos.dart';

import '../../home/data/models/movies_response_models.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepos searchRepos;
 final String language;

  SearchCubit(this.searchRepos, {required this.language, })
      : super(const SearchState.initial());
  String query='';
  Timer? _debounce;
  int _page=1;
  bool _hasMore= true;
  bool _isFetching= false;
 final List<MovieModel> searchList=[];
  updateQuery(String value) {
    query = value.trim();

    _debounce?.cancel();

    if (query.isEmpty) {
      searchList.clear();
      emit(const SearchState.initial());
      return;
    }

    _debounce = Timer(
      const Duration(milliseconds: 400),
          () {
        firstSearch();
      },
    );
  }
  Future<void> firstSearch()async{
    _page=1;
    _hasMore=true;
    searchList.clear();
  await  loadSearchMovies();
  }
  Future<void> loadMore()async{
    if(_isFetching || !_hasMore)return;
 await   loadSearchMovies();
  }

  Future<void> loadSearchMovies()async{
    if (_isFetching) return;
    _isFetching = true;
    if(_page==1){
    emit(const SearchState.loading());
    }

    final response= await searchRepos.getSearchMovies(
        query: query, language: language, page: _page);
    response.when(
        success: (searchMovies){
          if (query.isEmpty) {
            searchList.clear();
            emit(const SearchState.initial());
            return;
          }
        final  newListSearch= searchMovies.results??[];
        // final newListSearch = (searchMovies.results ?? [])
        //     .where((movie) {
        //   final title = movie.title ?? '';
        //   return title
        //       .toLowerCase()
        //       .startsWith(_query.toLowerCase());
        // })
        //     .toList();
        searchList.addAll(newListSearch );
        _hasMore=_page< (searchMovies.totalPages??0);
        _page++;
        emit(SearchState.success(
            searchMovies: List.of(searchList), hasMor: _hasMore));



        }, failure: (error){
          emit(SearchState.error(error: error.message??''));

    });
    _isFetching=false;
}
}
