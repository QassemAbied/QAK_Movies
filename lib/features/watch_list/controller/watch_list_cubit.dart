import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/network/api_result.dart';
import 'package:untitled3/features/watch_list/controller/watch_list_state.dart';
import 'package:untitled3/features/watch_list/data/models/add_watch_list_requst.dart';
import 'package:untitled3/features/watch_list/data/repos/watch_list_repos.dart';

import '../../home/data/models/movies_response_models.dart';

class WatchListCubit extends Cubit<WatchListState> {
  final WatchListRepos watchListRepos;
  WatchListCubit(this.watchListRepos) : super(const WatchListState.initial());

  final List<MovieModel> _watchList = [];
  final Set<int> watchListId={};
  loadWatchList({required String language}) async {
    List<MovieModel> allWatchList = [];
    int page = 1;
    bool hasMore = true;
    while (hasMore) {
      emit(const WatchListState.loading());
      final response = await watchListRepos.getWatchListMovies(
        language: language,
        page: page,
      );
      response.when(
        success: (watchListMovies) {
          final list = watchListMovies.results ?? [];
          allWatchList.addAll(list);
          hasMore = page < (watchListMovies.totalPages ?? 0);
          page++;
        },
        failure: (error) {
          emit(WatchListState.error(error: error.message ?? ''));
          hasMore = false;
        },
      );
    }
    final reversed = allWatchList.reversed.toList();
    _watchList
      ..clear()
      ..addAll(reversed);
    watchListId..clear()..addAll(reversed.map((e) => e.id!));
    emit(
      WatchListState.success(
        watchListMovies: List.of(_watchList),
        hasMor: false,
      ),
    );
  }

  addWatchList({required AddWatchListRequest adWatchListRequest,required MovieModel movie })async{
    _watchList.insert(0, movie);
    watchListId.add(adWatchListRequest.mediaId);
    emit(WatchListState.success(watchListMovies: List.of(_watchList), hasMor: false));
    await watchListRepos.addWitchList(addWatchListRequest: adWatchListRequest);
  }

  removeWatchList({required AddWatchListRequest adWatchListRequest, })async{
    _watchList.removeWhere((e)=>e.id==adWatchListRequest.mediaId);
    watchListId.remove(adWatchListRequest.mediaId);
    emit(WatchListState.success(watchListMovies: List.of(_watchList), hasMor: false));
    await watchListRepos.addWitchList(addWatchListRequest: adWatchListRequest);
  }
}
