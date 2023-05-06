

import 'package:equatable/equatable.dart';
import 'package:untitled3/domain/entities/add_watchlist_entities.dart';
import 'package:untitled3/domain/use_case/watchlist_use_case/add_watchlist_usecase.dart';

import '../../../domain/entities/add_item_request_entities.dart';
import '../../../domain/entities/movie_entities.dart';

enum WatchlistRequestStatus {
  empty,
  loading,
  loaded,
  error,
  itemAdded,
  itemRemoved,
  isItemAdded,
}

class WatchlistState extends Equatable {
  const WatchlistState({
    this.id,
    this.items = const [],
    this.status = WatchlistRequestStatus.loading,
    this.message = '',
  });

  final AddItemRequestEntities? id;
  final List<MovieEntities> items;
  final WatchlistRequestStatus status;
  final String message;

  WatchlistState copyWith({
    AddItemRequestEntities? id,
    List<MovieEntities>? items,
    WatchlistRequestStatus? status,
    String? message,
  }) {
    return WatchlistState(
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