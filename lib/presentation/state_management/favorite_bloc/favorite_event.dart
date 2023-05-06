import 'package:equatable/equatable.dart';

import '../../../domain/entities/movie_entities.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();
}

class GetFavoritesItemsEvent extends FavoritesEvent {
  @override
  List<Object?> get props => [];
}

class AddFavoritesItemEvent extends FavoritesEvent {
  final MovieEntities media;

  const AddFavoritesItemEvent({required this.media});

  @override
  List<Object?> get props => [media];
}

class RemoveFavoritesItemEvent extends FavoritesEvent {
  final MovieEntities media;

  const RemoveFavoritesItemEvent({required this.media});

  @override
  List<Object?> get props => [media];
}
