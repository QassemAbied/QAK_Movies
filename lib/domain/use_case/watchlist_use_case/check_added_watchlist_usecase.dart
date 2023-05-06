// import 'package:dartz/dartz.dart';
//
// import '../../../core/base_usecase.dart';
// import '../../../core/error/failure_request.dart';
// import '../../repository_domain/watchlist_repository.dart';
//
// class getCheckAddedWatchListUseCase extends BaseUseCase<int , int>{
//   final WatchListRepository watchListRepository;
//   getCheckAddedWatchListUseCase(this.watchListRepository);
//   @override
//   Future<Either<Failure, int>> call(int parameter)async {
//     return await watchListRepository.checkIfItemAdded(parameter);
//   }
//
// }