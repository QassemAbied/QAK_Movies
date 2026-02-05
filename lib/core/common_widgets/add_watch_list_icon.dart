import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/features/home/data/models/movies_response_models.dart';

import '../../features/watch_list/controller/watch_list_cubit.dart';
import '../../features/watch_list/controller/watch_list_state.dart';
import '../../features/watch_list/data/models/add_watch_list_requst.dart';
import '../helpers/extension.dart';

class AddWatchListIcon extends StatelessWidget {
  const AddWatchListIcon({super.key, required this.id, required this.model});

  final int? id;
  final MovieModel model;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchListCubit, WatchListState>(

      builder: (context, state) {
        final isWatch =
        context
            .watch<WatchListCubit>()
            .watchListId
            .contains(id??0);
        return Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            border: Border.all(color: context.colors.onSurface, width: 2),
          ),
          child:

         Align(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              //context.read<FavoritesCubit>().isFavorite==true;
              if(isWatch){
                context.read<WatchListCubit>().removeWatchList(
                  adWatchListRequest: AddWatchListRequest(
                    "movie",
                    id??0,
                    false,
                  ),
                );

              }else{
                context.read<WatchListCubit>().addWatchList(
                  adWatchListRequest: AddWatchListRequest(
                    "movie",
                    id??0,
                    true,

                  ),
                  movie: model,
                );
              }

            },
            child: Icon(
              Icons.bookmark,
              color: isWatch ? context.colors.primary:
              context.colors.onSurfaceVariant,
            ),
          ),
        ),

        );
      },
    );
  }
}
