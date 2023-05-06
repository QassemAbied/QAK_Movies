import 'package:bloc/bloc.dart';
import 'package:untitled3/core/base_usecase.dart';
import 'package:untitled3/domain/use_case/favorite_use_case/add_favorite_use_case.dart';
import 'package:untitled3/domain/use_case/favorite_use_case/favorite_usecase.dart';
import 'package:untitled3/domain/use_case/favorite_use_case/remove_favorite_use_case.dart';
import 'package:untitled3/presentation/state_management/favorite_bloc/favorite_event.dart';
import 'package:untitled3/presentation/state_management/favorite_bloc/favorite_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final FavoriteUseCase favoriteUseCase;
  final getAddFavoriteUseCase addFavoriteUseCase;
  final getRemoveFavoriteUseCase removeFavoriteUseCase;
  FavoritesBloc(
      this.favoriteUseCase, this.addFavoriteUseCase, this.removeFavoriteUseCase)
      : super(FavoritesState()) {
    on<GetFavoritesItemsEvent>((event, emit) async {
      final result = await favoriteUseCase.call(NoParameter());

      result.fold((l) {
        emit(state.copyWith(
            status: FavoritesRequestStatus.error, message: l.message));
      }, (r) {
        emit(state.copyWith(items: r, status: FavoritesRequestStatus.loaded));
      });
    });

    on<AddFavoritesItemEvent>((event, emit) async {
      final result = await addFavoriteUseCase.call(event.media);

      result.fold((l) {
        emit(state.copyWith(
            status: FavoritesRequestStatus.error, message: l.message));
      }, (r) {
        emit(state.copyWith(id: r, status: FavoritesRequestStatus.loaded));
      });
    });

    on<RemoveFavoritesItemEvent>((event, emit) async {
      final result = await removeFavoriteUseCase.call(event.media);

      result.fold((l) {
        emit(state.copyWith(
            status: FavoritesRequestStatus.error, message: l.message));
      }, (r) {
        emit(state.copyWith(id: r, status: FavoritesRequestStatus.loaded));
      });
    });
  }
}
