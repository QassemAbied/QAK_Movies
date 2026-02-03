import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/features/home/data/models/movies_response_models.dart';

import '../../features/favorites/controller/favorites_cubit.dart';
import '../../features/favorites/controller/favorites_state.dart';
import '../../features/favorites/data/models/add_favorite_request.dart';
import '../helpers/extension.dart';

class AddFavoritesIcon extends StatelessWidget {
  const AddFavoritesIcon({super.key, required this.id, this.model});

  final int id;
  final MovieModel? model;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(

      builder: (context, state) {
        final isFav =
        context
            .watch<FavoritesCubit>()
            .favoriteIds
            .contains(id ?? 0,);
        return Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: context.colors.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: context.colors.onSurface, width: 2),
          ),
          child:
         Align(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              if(isFav){
                context.read<FavoritesCubit>().removeFavorite(
                  request: AddFavoriteRequest(
                    "movie",
                    id ?? 0,
                    false,
                  ),
                );

              }else{
                context.read<FavoritesCubit>().addFavorites(
                  addFavoriteRequest: AddFavoriteRequest(
                    "movie",
                    id ?? 0,
                    true,

                  ),
                  movie: model!,
                );
              }

            },
            child: Icon(
              Icons.favorite,
              color: isFav ? Colors.red :
              context.colors.onSurfaceVariant,
            ),
          ),
        ),



        );
      },
    );
  }
}
