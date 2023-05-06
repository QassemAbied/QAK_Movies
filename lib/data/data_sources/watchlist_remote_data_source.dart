import 'package:dio/dio.dart';
import 'package:untitled3/core/api.dart';
import 'package:untitled3/data/modules/add_item_moduels.dart';
import 'package:untitled3/data/modules/movie_modules.dart';
import '../../core/error/error_handle.dart';
import '../../core/error/servier_exception.dart';
import '../../domain/entities/movie_entities.dart';

abstract class WatchlistLocalDataSource {
  Future<List<MovieModules>> getWatchListItems();
  Future<AddItemRequestModules> addWatchListItem(MovieEntities media);
  Future<AddItemRequestModules> removeWatchListItem(MovieEntities media);
}

class WatchlistLocalDataSourceImpl extends WatchlistLocalDataSource {
  @override
  Future<List<MovieModules>> getWatchListItems() async {
    final response = await Dio().get(ConstanceApi.WatchList);
    if (response.statusCode == 200) {
      return List<MovieModules>.from((response.data['results'] as List)
          .map((e) => MovieModules.fromJson(e))
          .toList());
    } else {
      throw ServierException(ErrorHandleApi.fromJson(response.data));
    }
  }

  @override
  Future<AddItemRequestModules> addWatchListItem(MovieEntities media) async {
    final response = await Dio().postUri(
      Uri.parse(
        ConstanceApi.AddWatchLisrt,
      ),
      data: {
        'media_type': 'movie',
        'media_id': media.id.toString(),
        'watchlist': 'true',
      },
      options: Options(headers: {
        'Content-Type': 'application/json;charset=utf-8',
      }),
    );

    print(response);
    print(media.id.toString());
    return AddItemRequestModules.fromJson(response.data);
  }

  @override
  Future<AddItemRequestModules> removeWatchListItem(MovieEntities media) async {
    final response = await Dio().postUri(
      Uri.parse(
        ConstanceApi.AddWatchLisrt,
      ),
      data: {
        'media_type': 'movie',
        'media_id': media.id.toString(),
        'watchlist': false,
      },
      options: Options(headers: {
        'Content-Type': 'application/json;charset=utf-8',
      }),
    );

    print(response);
    print(media.id.toString());
    return AddItemRequestModules.fromJson(response.data);
  }
}
