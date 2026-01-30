


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/features/details_movies/data/models/video_response.dart';
import 'package:untitled3/features/details_movies/data/repos/details_movies_repos.dart';

import '../../../core/network/api_error_model.dart';
import '../../../core/network/api_result.dart';
import '../../home/data/models/movies_response_models.dart';
import '../data/models/credits_response.dart';
import '../data/models/details_movies_response.dart';
import '../data/models/images_movies_response.dart';
import 'details_movies_state.dart';

class DetailsMoviesCubit extends Cubit<DetailsMoviesState> {
  final DetailsMoviesRepository detailsMoviesRepository;
  DetailsMoviesCubit(this.detailsMoviesRepository) : super(const DetailsMoviesState.detailsInitial());

  void loadDetailsMovies({required String language, required int id})async{
    emit(const DetailsMoviesState.detailsLoading());
  //  final response= await detailsMoviesRepository.getDetailsMovies(language: language, id: id);
    final response = await Future.wait([
      detailsMoviesRepository.getDetailsMovies( language: language, id: id),
      detailsMoviesRepository.getImageForMovies(id: id),
      detailsMoviesRepository.getCastForMovies( language: language, id: id),
      detailsMoviesRepository.getSimilarMovies( language: language, id: id),
      detailsMoviesRepository.getVideoMovies( language: language, id: id),
    ]);
    String? errorMessage;

    for (final result in response) {
      result.maybeWhen(

        failure: (e) =>  errorMessage ??= e.message,
        orElse: () {},
      );
    }

    if (errorMessage != null) {
      emit(DetailsMoviesState.detailsError(error: errorMessage!));
      return;
    }

    emit(
      DetailsMoviesState.detailsSuccess(
        detailsMoviesResponse:
        (response[0] as ApiResult<DetailsMoviesResponse>)
            .maybeWhen(
              success: (d) => d,
              orElse: () => throw Exception(),
            ),
        imagesMoviesResponse:
        (response[1] as ApiResult<ImagesMoviesResponse>)
            .maybeWhen(
          success: (d) => d,
          orElse: () => throw Exception(),
        ),
        creditsResponse:
        (response[2] as ApiResult<CreditsResponse>)
            .maybeWhen(
          success: (d) => d,
          orElse: () => throw Exception(),
        ),
        moviesResponse:
        (response[3] as ApiResult<MoviesResponse>)
            .maybeWhen(
              success: (d) => d,
              orElse: () => throw Exception(),
            ),
        videoResponses: (response[4] as ApiResult<VideoResponses>)
            .maybeWhen(
          success: (d) => d,
          orElse: () => throw Exception(),
        ),
      ),
    );

  }

}
