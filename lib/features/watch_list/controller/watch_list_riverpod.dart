import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled3/core/network/api_result.dart';
import 'package:untitled3/features/providers.dart';
import 'package:untitled3/features/watch_list/data/models/watch_list_data.dart';
import 'package:untitled3/features/watch_list/data/repos/watch_list_repos.dart';
import '../../home/data/models/movies_response_models.dart';
import '../data/models/add_watch_list_requst.dart';

class WatchListNotifier extends FamilyAsyncNotifier<WatchListData, String> {
  WatchListRepos get _repos => ref.watch(watchListRepoProvider);
  late final String _language;
  int _page = 1;
  bool _hasMore = true;
  final List<MovieModel> _watchList = [];
  final Set<int> watchListId = {};
  @override
  FutureOr<WatchListData> build(String arg) async {
    _language = arg;
    _page = 1;
    _hasMore = true;
    _watchList.clear();
    return getWatchList();
  }

  Future<WatchListData> getWatchList() async {
    final List<MovieModel> _localList = [];
    while (_hasMore) {
      final response = await _repos.getWatchListMovies(
        language: _language,
        page: _page,
      );
      response.when(
        success: (data) {
          final list = data.results ?? [];
          _localList.addAll(list);
          _hasMore = _page < (data.totalPages ?? 0);
          _page++;
        },
        failure: (error) {
          throw Exception(error.message);
        },
      );
    }
    final reversed = _localList.reversed.toList();
    _watchList
      ..clear()
      ..addAll(reversed);
    watchListId..clear()..addAll(reversed.map((e)=>e.id!));
    return WatchListData(
      watchListMovies: List.of(_watchList),
      hasMore: false,
      watchId: Set.of(watchListId),
    );
  }

  Future<void> addWatchList({
    required AddWatchListRequest adWatchListRequest,
    required MovieModel movie,
  }) async {
    _watchList.insert(0, movie);
    watchListId.add(adWatchListRequest.mediaId);
    state = AsyncData(
      WatchListData(
        watchListMovies: List.of(_watchList),
        hasMore: false,
        watchId: Set.of(watchListId),
      ),
    );
    await _repos.addWitchList(addWatchListRequest: adWatchListRequest);
  }

  Future<void> removeWatchList({
    required AddWatchListRequest adWatchListRequest,
  }) async {
    _watchList.removeWhere((e) => e.id == adWatchListRequest.mediaId);
    watchListId.remove(adWatchListRequest.mediaId);
    state = AsyncData(
      WatchListData(
        watchListMovies: List.of(_watchList),
        hasMore: false,
        watchId: Set.of(watchListId),
      ),
    );
    await _repos.addWitchList(addWatchListRequest: adWatchListRequest);
  }
}
