import 'package:untitled3/features/home/data/models/movies_response_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/network/api_error_model.dart';



part 'all_movies_state.freezed.dart';
@Freezed()
class AllMoviesState with _$AllMoviesState {
  const factory AllMoviesState.initial() = _Initial;
  const factory AllMoviesState.loading() = Loading;
  const factory AllMoviesState.success({
    required List<MovieModel> movies,
    required bool hasMore,


  }) = Success;
  const factory AllMoviesState.error({required ApiErrorModel error}) = Error;

}