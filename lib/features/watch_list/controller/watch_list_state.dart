import 'package:untitled3/features/favorites/data/models/add_fav_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../home/data/models/movies_response_models.dart';
part 'watch_list_state.freezed.dart';
@Freezed()
class WatchListState with _$WatchListState {
  const factory WatchListState.initial() = _Initial;

  const factory WatchListState.loading() = Loading;

  const factory WatchListState.success({
    required List<MovieModel> watchListMovies,
    required bool hasMor,


  }) = Success;

  const factory WatchListState.error({required String error}) = Error;

}