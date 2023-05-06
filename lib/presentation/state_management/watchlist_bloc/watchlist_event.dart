import 'package:equatable/equatable.dart';
import 'package:untitled3/domain/entities/movie.dart';
import 'package:untitled3/domain/entities/movie_entities.dart';

import '../../../domain/use_case/watchlist_use_case/add_watchlist_usecase.dart';

abstract class WatchlistEvent extends Equatable {
  const WatchlistEvent();
}

class GetWatchListItemsEvent extends WatchlistEvent {
  @override
  List<Object?> get props => [];
}

class AddWatchListItemEvent extends WatchlistEvent {
  final MovieEntities media;

  const AddWatchListItemEvent({required this.media});

  @override
  List<Object?> get props => [media];
}

class RemoveWatchListItemEvent extends WatchlistEvent {
  final MovieEntities media;

  const RemoveWatchListItemEvent({required this.media});

  @override
  List<Object?> get props => [media];
}
//
// class CheckItemAddedEvent extends WatchlistEvent {
//   final int tmdbId;
//
//   const CheckItemAddedEvent({
//     required this.tmdbId,
//   });
//
//   @override
//   List<Object?> get props => [tmdbId];
// }