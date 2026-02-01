import 'package:untitled3/features/favorites/data/models/add_fav_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../home/data/models/movies_response_models.dart';
part 'favorites_state.freezed.dart';
@Freezed()
class FavoritesState with _$FavoritesState {
  const factory FavoritesState.initial() = _Initial;
  const factory FavoritesState.loading() = Loading;
  const factory FavoritesState.success({
    required List<MovieModel> favoritesMovies,
    required bool hasMor,


  }) = Success;
  const factory FavoritesState.error({required String error}) = Error;



  const factory FavoritesState.addFavLoading() = AddFavLoading;
  const factory FavoritesState.addFavSuccess({
    required AddFavResponse addFavResponse,


  }) = AddFavSuccess;
  const factory FavoritesState.addFavError({required String error}) = AddFavError;

}