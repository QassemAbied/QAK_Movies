import 'package:equatable/equatable.dart';
import 'package:untitled3/domain/entities/movie_entities.dart';

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
