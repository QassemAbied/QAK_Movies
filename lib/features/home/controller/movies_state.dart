import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:untitled3/features/home/data/models/movies_genres_models.dart';
import '../../../core/network/api_error_model.dart';
import '../data/models/movies_response_models.dart';


part 'movies_state.freezed.dart';

@Freezed()
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = Loading;
  const factory HomeState.success({
    required List<MovieModel> nowPlaying,
    required List<MovieModel> popular,
    required List<MovieModel> topRated,
    required List<MovieModel> upcoming,

  }) = Success;
  const factory HomeState.error({required String error}) = Error;

}


