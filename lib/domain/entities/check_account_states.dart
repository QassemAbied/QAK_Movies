import 'package:equatable/equatable.dart';

class CheckAccountStates extends Equatable{
  final int id;
  final bool favorite;
  final bool rated;
  final bool watchlist;
 CheckAccountStates({required this.id , required this.watchlist , required this.rated , required this.favorite});
  @override
  List<Object?> get props => [id, favorite , rated , watchlist];

}