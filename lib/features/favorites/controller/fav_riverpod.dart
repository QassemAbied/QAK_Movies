import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled3/core/network/api_result.dart';
import 'package:untitled3/features/favorites/data/models/add_favorite_request.dart';
import 'package:untitled3/features/favorites/data/models/fav_data.dart';
import 'package:untitled3/features/favorites/data/repo/favorites_repos.dart';
import 'package:untitled3/features/providers.dart';

import '../../home/data/models/movies_response_models.dart';

class FavNotifier extends FamilyAsyncNotifier<FavData, String> {
  FavoritesRepos get _repos => ref.watch(favRepoProvider);
  late final String _language;
  int _page = 1;
  bool _hasMore = true;
  final List<MovieModel> _favoritesMovies = [];
  final Set<int> favId = {};

  @override
  Future<FavData> build(String arg) {
    _language = arg;
    _page = 1;
    _hasMore = true;
    _favoritesMovies.clear();
    return getFavorites();
  }

  Future<FavData> getFavorites() async {
    final List<MovieModel> favList = [];
    while (_hasMore) {
      final response = await _repos.getFavoritesMovies(
        language: _language,
        page: _page,
      );
      response.when(
        success: (favData) {
          final newList = favData.results ?? [];
          favList.addAll(newList);
          _hasMore = _page < (favData.totalPages ?? 0);
          _page++;
        },
        failure: (e) {
          throw Exception(e.message);
        },
      );
    }
    final reversed = favList.reversed.toList();
    _favoritesMovies
      ..clear()
      ..addAll(reversed);
    favId
      ..clear()
      ..addAll(reversed.map((e) => e.id!));
    return FavData(
        favoritesMovies: List.of(_favoritesMovies),
        hasMore: false, favId: Set.of(favId),);
  }

  Future<void> addFavorites({
    required AddFavoriteRequest addFavoriteRequest,
    required MovieModel movie,
  }) async {
    _favoritesMovies.insert(0, movie);
    favId.add(addFavoriteRequest.mediaId);
    state = AsyncData(FavData(favoritesMovies: List.of(_favoritesMovies),
        hasMore: false, favId: Set.of(favId),));
    await _repos.getAddFavorites(addFavoriteRequest: addFavoriteRequest);
  }


  Future<void> removeFav(
      { required AddFavoriteRequest addFavoriteRequest,})async{
    _favoritesMovies.removeWhere((e)=>e.id==addFavoriteRequest.mediaId);
    favId.remove(addFavoriteRequest.mediaId);
    state =AsyncData(FavData(favoritesMovies: List.of(_favoritesMovies),
        hasMore: false, favId: Set.of(favId),));
    await _repos.getAddFavorites(addFavoriteRequest: addFavoriteRequest);
  }
}
