import 'package:untitled3/features/details_movies/data/models/credits_response.dart';
import 'package:untitled3/features/details_movies/data/models/details_movies_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:untitled3/features/details_movies/data/models/images_movies_response.dart';
import 'package:untitled3/features/details_movies/data/models/video_response.dart';
import 'package:untitled3/features/home/data/models/movies_response_models.dart';
import '../../../core/network/api_error_model.dart';

part 'details_movies_state.freezed.dart';

@Freezed()
class DetailsMoviesState with _$DetailsMoviesState {
  const factory DetailsMoviesState.detailsInitial() = _Initial;
  const factory DetailsMoviesState.detailsLoading() = Loading;
  const factory DetailsMoviesState.detailsSuccess({
    required DetailsMoviesResponse detailsMoviesResponse,
    required CreditsResponse creditsResponse,
    required ImagesMoviesResponse imagesMoviesResponse,
    required MoviesResponse moviesResponse,
    required VideoResponses videoResponses,
  }) = Success;
  const factory DetailsMoviesState.detailsError({required String  error}) = Error;
}