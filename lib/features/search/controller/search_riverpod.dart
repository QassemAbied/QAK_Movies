import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled3/core/network/api_result.dart';
import 'package:untitled3/features/providers.dart';
import 'package:untitled3/features/search/data/models/search_data.dart';
import 'package:untitled3/features/search/data/repos/search_repos.dart';
import '../../home/data/models/movies_response_models.dart';

class SearchNotifier extends FamilyAsyncNotifier<SearchData, String>{
  SearchRepos get _repos=> ref.watch(searchRepoProvider);
   int _page=1;
   late final String _language;
  Timer? _debounce;
   String query='';
   bool _hasMore=true;
   bool _isFetching= false;
   final  List<MovieModel> searchList=[];




  @override
  Future<SearchData> build(String arg) async{
   _language= arg;
   return SearchData(
     results: [],
     hasMore: false,
   );
  }


  updateQuery(String value) {
    query = value.trim();

    _debounce?.cancel();

    if (query.isEmpty) {
      searchList.clear();
      state = AsyncData(
        SearchData(results: const [], hasMore: false),
      );
      return;
    }

    _debounce = Timer(
      const Duration(milliseconds: 400),
          () {
        firstSearch();
      },
    );
  }

  firstSearch()async{
    _hasMore=true;
    _page=1;
    searchList.clear();
    state = const AsyncLoading();
    state =await AsyncValue.guard(()=> getSearch(isFirstLoad: true),) ;




  }
  loadMoreSearch()async{
    if (_isFetching || !_hasMore) return;
    final newData = await getSearch();
    state = AsyncData(newData);
  }
  Future<SearchData> getSearch({bool isFirstLoad =false})async{
    _isFetching=true;
    final response= await _repos.getSearchMovies(
        query: query,
        language: _language,
        page: _page
    );
    return response.when(
        success: (data){
          final newList = data.results ?? [];
          if (isFirstLoad) {
            searchList.clear();
          }
          searchList.addAll(newList);
          _hasMore = newList.isNotEmpty;
          _page++;
          _isFetching = false;
          return SearchData(
            results: List.of(searchList),
            hasMore: _hasMore,
          );
        },
        failure:  (error) {
          _isFetching = false;
          throw Exception(error.message);
        },
    );
  }

}