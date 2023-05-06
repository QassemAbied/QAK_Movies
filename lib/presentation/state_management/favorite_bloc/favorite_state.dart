import 'package:equatable/equatable.dart';
import 'package:untitled3/domain/entities/add_item_request_entities.dart';

import '../../../domain/entities/movie_entities.dart';

enum FavoritesRequestStatus {
  empty,
  loading,
  loaded,
  error,
  itemAdded,
  itemRemoved,
  isItemAdded,
}

class FavoritesState extends Equatable {
  const FavoritesState({
    this.id,
    this.items = const [],
    this.status = FavoritesRequestStatus.loading,
    this.message = '',
  });

  final AddItemRequestEntities? id;
  final List<MovieEntities> items;
  final FavoritesRequestStatus status;
  final String message;

  FavoritesState copyWith({
    AddItemRequestEntities? id,
    List<MovieEntities>? items,
    FavoritesRequestStatus? status,
    String? message,
  }) {
    return FavoritesState(
      id: id ?? this.id,
      items: items ?? this.items,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
   id,
    items,
    status,
    message,
  ];
}