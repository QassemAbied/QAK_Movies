import 'package:untitled3/features/favorites/data/models/add_fav_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../home/data/models/movies_response_models.dart';
part 'search_state.freezed.dart';
@Freezed()
class SearchState with _$SearchState {
  const factory SearchState.initial() = Initial;

  const factory SearchState.loading() = Loading;

  const factory SearchState.success({
    required List<MovieModel> searchMovies,
    required bool hasMor,


  }) = Success;

  const factory SearchState.error({required String error}) = Error;

}