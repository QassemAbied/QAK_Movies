import 'package:dio/dio.dart';
import 'package:untitled3/data/modules/movie_modules.dart';
import '../../core/api.dart';
import '../../core/error/error_handle.dart';
import '../../core/error/servier_exception.dart';
import '../../domain/entities/movie_entities.dart';
import '../modules/add_item_moduels.dart';

abstract class FavoriteRemoteDataSource {
  Future<List<MovieModules>> getFavoriteMovie();
  Future<AddItemRequestModules> addFavoriteItem(MovieEntities media);
  Future<AddItemRequestModules> RemoveFavoriteItem(MovieEntities media);
}

class FavoriteRemoteDataSourceImpl implements FavoriteRemoteDataSource {
  Map<int, bool> isFav = {};
  @override
  Future<List<MovieModules>> getFavoriteMovie() async {
    final response = await Dio().get(ConstanceApi.Favorites);
    if (response.statusCode == 200) {
      final fav = List<MovieModules>.from((response.data['results'] as List)
          .map((e) => MovieModules.fromJson(e))
          .toList());

      fav.forEach((element) {
        isFav.addAll({element.id: element.isFav});
      });
      print(isFav.toString());
      return List<MovieModules>.from((response.data['results'] as List)
          .map((e) => MovieModules.fromJson(e))
          .toList());
    } else {
      throw ServierException(ErrorHandleApi.fromJson(response.data));
    }
  }
  //final  bool IsFav =true ;
  // final bool Isoav= false;

  @override
  Future<AddItemRequestModules> addFavoriteItem(MovieEntities media) async {
    final response = await Dio().postUri(
      Uri.parse(
        ConstanceApi.AddFavorites,
      ),
      data: {
        'media_type': 'movie',
        'media_id': media.id.toString(),
        'favorite': 'true',
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
  Future<AddItemRequestModules> RemoveFavoriteItem(MovieEntities media) async {
    final response = await Dio().postUri(
      Uri.parse(
        ConstanceApi.RemoveFavorites,
      ),
      data: {
        'media_type': 'movie',
        'media_id': media.id.toString(),
        'favorite': false,
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
