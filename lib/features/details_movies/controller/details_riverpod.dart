import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled3/core/network/api_result.dart';
import 'package:untitled3/features/details_movies/data/models/details_data.dart';
import 'package:untitled3/features/providers.dart';
import '../../home/data/models/movies_response_models.dart';
import '../data/models/credits_response.dart';
import '../data/models/details_movies_response.dart';
import '../data/models/details_params.dart';
import '../data/models/images_movies_response.dart';
import '../data/models/video_response.dart';
import '../data/repos/details_movies_repos.dart';

class DetailsNotifier extends FamilyAsyncNotifier<DetailsData, DetailsParams> {
  DetailsMoviesRepository get _repos => ref.watch(detailsRepoProvider);
  late final int _moviesId;
  late final String _language;
  @override
  FutureOr<DetailsData> build(DetailsParams arg) async {
    _moviesId = arg.movieId;
    _language = arg.language;
    ref.keepAlive();
    return  getDetailsMovies();
  }

  Future<DetailsData> getDetailsMovies() async {
    final results = await Future.wait([
      _repos.getDetailsMovies(language: _language, id: _moviesId),
      _repos.getImageForMovies(id: _moviesId),
      _repos.getCastForMovies(language: _language, id: _moviesId),
      _repos.getVideoMovies(language: _language, id: _moviesId),
      _repos.getSimilarMovies(language: _language, id: _moviesId),
    ]);

    // String? errorMessage;
    // for (final result in results) {
    //   result.maybeWhen(
    //     failure: (e) => errorMessage ??= e.message,
    //     orElse: () {},
    //   );
    // }
    // if (errorMessage != null) {
    //   throw Exception(errorMessage);
    // }


    return DetailsData(
      details: (results[0] as ApiResult<DetailsMoviesResponse>).when(
        success: (d) => d,
        failure: (e) => throw Exception(e.message),
      ),

      backdrops: (results[1] as ApiResult<ImagesMoviesResponse>).when(
        success: (d) => d,
        failure: (e) => throw Exception(e.message),
      ),

      cast: (results[2] as ApiResult<CreditsResponse>).when(
        success: (d) => d,
        failure: (e) => throw Exception(e.message),
      ),

      videos: (results[3] as ApiResult<VideoResponses>).when(
        success: (d) => d,
        failure: (e) => throw Exception(e.message),
      ),

      similarMovies: (results[4] as ApiResult<MoviesResponse>).when(
        success: (d) => d,
        failure: (e) => throw Exception(e.message),
      ),
    );

  }
}
