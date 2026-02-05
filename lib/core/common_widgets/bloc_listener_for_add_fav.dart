import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/helpers/extension.dart';
import 'package:untitled3/features/favorites/controller/favorites_cubit.dart';
import 'package:untitled3/features/favorites/controller/favorites_state.dart';

import '../di.dart';

// class BlocListenerForAddFav extends StatelessWidget {
//   const BlocListenerForAddFav({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<FavoritesCubit,FavoritesState>(
//         listenWhen: (previous, current) =>
//         current is AddFavLoading || current is AddFavSuccess || current is AddFavError,
//         listener: (context , state){
//            state.whenOrNull(
//             addFavLoading: () {
//               return showDialog(
//                 context: context,
//                 builder: (context) {
//                   return const Center(child: CircularProgressIndicator());
//                 },
//               );
//             },
//            addFavError:  (value) {
//              context.pop();
//              return showDialog(
//                context: context,
//                builder: (context) {
//                  return AlertDialog(content: Text(value));
//                },
//              );
//            },
//              addFavSuccess: (addFavResponse){
//                Sl<FavoritesCubit>().loadFavoritesMovies(language: '');
//                context.pop();
//              }
//           );
//   },
//   child:const SizedBox.shrink()
//     );
//   }
// }
