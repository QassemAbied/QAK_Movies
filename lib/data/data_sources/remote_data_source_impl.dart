import 'package:dio/dio.dart';
import 'package:untitled3/core/api_constance.dart';
import 'package:untitled3/data/data_sources/base_remote_data_sources.dart';
import 'package:untitled3/data/modules/cast_movie_modules.dart';
import 'package:untitled3/data/modules/check_account_states_modules.dart';
import 'package:untitled3/data/modules/genre_module.dart';
import 'package:untitled3/data/modules/image_movie_module.dart';
import 'package:untitled3/data/modules/movie_modules.dart';
import 'package:untitled3/domain/use_case/details_use_case/castmovie_usecase.dart';
import 'package:untitled3/domain/use_case/details_use_case/imagemovie_uescase.dart';
import 'package:untitled3/domain/use_case/movies_use_case/moviebygenre_usecase.dart';
import 'package:untitled3/domain/use_case/search_usecase.dart';
import 'package:untitled3/domain/use_case/details_use_case/similar_usecase.dart';
import '../../core/error/error_handle.dart';
import '../../core/error/servier_exception.dart';

class RemoteDataSourceImpl implements RemoteDataSources {
  @override
  Future<List<MovieModules>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.PlayingNow);
    if (response.statusCode == 200) {
      return List<MovieModules>.from((response.data['results'] as List)
          .map((e) => MovieModules.fromJson(e))
          .toList());
    } else {
      throw ServierException(ErrorHandleApi.fromJson(response.data));
    }
  }

  @override
  Future<List<GenreModules>> getGenreMovies() async {
    final response = await Dio().get(ApiConstance.genreApi);
    if (response.statusCode == 200) {
      return List<GenreModules>.from((response.data['genres'] as List)
          .map((e) => GenreModules.fromJson(e))
          .toList());
    } else {
      throw ServierException(ErrorHandleApi.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModules>> getMoviesByGenres(GenreId parameter) async {
    final response = await Dio().get(ApiConstance.movieByGenre(parameter.id));
    if (response.statusCode == 200) {
      return List<MovieModules>.from((response.data['results'] as List)
          .map((e) => MovieModules.fromJson(e))
          .toList());
    } else {
      throw ServierException(ErrorHandleApi.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModules>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.TopRated);
    if (response.statusCode == 200) {
      return List<MovieModules>.from((response.data['results'] as List)
          .map((e) => MovieModules.fromJson(e))
          .toList());
    } else {
      throw ServierException(ErrorHandleApi.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModules>> getUpComingMovies() async {
    final response = await Dio().get(ApiConstance.UpComing);
    if (response.statusCode == 200) {
      return List<MovieModules>.from((response.data['results'] as List)
          .map((e) => MovieModules.fromJson(e))
          .toList());
    } else {
      throw ServierException(ErrorHandleApi.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModules>> getTrendMovies() async {
    final response = await Dio().get(ApiConstance.Trend);
    if (response.statusCode == 200) {
      return List<MovieModules>.from((response.data['results'] as List)
          .map((e) => MovieModules.fromJson(e))
          .toList());
    } else {
      throw ServierException(ErrorHandleApi.fromJson(response.data));
    }
  }

  Map<int, bool> isTrue = {};
  @override
  Future<MovieModules> getDetailsMovies(int parameter) async {
    final response = await Dio().get(ApiConstance.DetailsMovie(parameter));
    if (response.statusCode == 200) {
      MovieModules movieModules = MovieModules.fromJson(response.data);

      await getCheckAccountStates(parameter);
      // await getVideoMovies(parameter) ;
      return MovieModules.fromJson(response.data);
    } else {
      throw ServierException(ErrorHandleApi.fromJson(response.data));
    }
  }

  @override
  Future<List<ImageMovieModule>> getImageMovies(ImageMovieId parameter) async {
    final response = await Dio().get(ApiConstance.ImageForMovie(parameter.id));
    if (response.statusCode == 200) {
      return List<ImageMovieModule>.from((response.data['backdrops'] as List)
          .map((e) => ImageMovieModule.fromJson(e))
          .toList());
    } else {
      throw ServierException(ErrorHandleApi.fromJson(response.data));
    }
  }

  @override
  Future<List<CastMovieModule>> getCastMovies(CastMovieId parameter) async {
    final response = await Dio().get(ApiConstance.CastForMovie(parameter.id));
    if (response.statusCode == 200) {
      return List<CastMovieModule>.from((response.data['cast'] as List)
          .map((e) => CastMovieModule.fromJson(e))
          .toList());
    } else {
      throw ServierException(ErrorHandleApi.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModules>> getSimilarMovies(SimilarId parameter) async {
    final response = await Dio().get(ApiConstance.SimilarMovie(parameter.id));
    if (response.statusCode == 200) {
      return List<MovieModules>.from((response.data['results'] as List)
          .map((e) => MovieModules.fromJson(e))
          .toList());
    } else {
      throw ServierException(ErrorHandleApi.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModules>> getSearchMovies(SearchValue parameter) async {
    final response = await Dio().get(ApiConstance.SearchMovie(parameter.value));
    if (response.statusCode == 200) {
      return List<MovieModules>.from((response.data['results'] as List)
          .map((e) => MovieModules.fromJson(e))
          .toList());
    } else {
      throw ServierException(ErrorHandleApi.fromJson(response.data));
    }
  }

  @override
  Future<CheckAccountStatesModules> getCheckAccountStates(int parameter) async {
    final response = await Dio().get(ApiConstance.CheckAccount(parameter));
    if (response.statusCode == 200) {
      return CheckAccountStatesModules.fromJson(response.data);
    } else {
      throw ServierException(ErrorHandleApi.fromJson(response.data));
    }
  }

  @override
  Future<String> getVideoMovies(
    int parameter,
  ) async {
    final response = await Dio().get(ApiConstance.VideoMovie(parameter));
    if (response.statusCode == 200) {
      final youtubeId = response.data['results'][0]['key'];
      return youtubeId;
    } else {
      throw ServierException(ErrorHandleApi.fromJson(response.data));
    }
  }
}
