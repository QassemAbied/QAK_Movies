import 'package:bloc/bloc.dart';
import 'package:untitled3/core/base_usecase.dart';
import 'package:untitled3/domain/use_case/watchlist_use_case/add_watchlist_usecase.dart';
import 'package:untitled3/domain/use_case/watchlist_use_case/remove_watchlist_usecase.dart';
import 'package:untitled3/domain/use_case/watchlist_use_case/watchlist_usecase.dart';
import 'package:untitled3/presentation/state_management/watchlist_bloc/watchlist_event.dart';
import 'package:untitled3/presentation/state_management/watchlist_bloc/watchlist_state.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  final getWatchListUseCase watchListUseCase;
  final getAddWatchListUseCase addWatchListUseCase;
  final getRemoveWatchListUseCase removeWatchListUseCase;
  WatchlistBloc(this.watchListUseCase, this.addWatchListUseCase,
      this.removeWatchListUseCase)
      : super(WatchlistState()) {
    on<GetWatchListItemsEvent>((event, emit) async {
      final result = await watchListUseCase.call(NoParameter());

      result.fold((l) {
        emit(state.copyWith(
            status: WatchlistRequestStatus.error, message: l.message));
      }, (r) {
        emit(state.copyWith(items: r, status: WatchlistRequestStatus.loaded));
      });
    });

    on<AddWatchListItemEvent>((event, emit) async {
      final result = await addWatchListUseCase.call(event.media);

      result.fold((l) {
        emit(state.copyWith(
            status: WatchlistRequestStatus.error, message: l.message));
      }, (r) {
        emit(state.copyWith(id: r, status: WatchlistRequestStatus.loaded));
      });
    });

    on<RemoveWatchListItemEvent>((event, emit) async {
      final result = await removeWatchListUseCase.call(event.media);

      result.fold((l) {
        emit(state.copyWith(
            status: WatchlistRequestStatus.error, message: l.message));
      }, (r) {
        emit(state.copyWith(id: r, status: WatchlistRequestStatus.loaded));
      });
    });
  }
}
