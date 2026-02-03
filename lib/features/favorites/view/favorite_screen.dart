import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/common_widgets/grid_view/grid_view_widget.dart';
import 'package:untitled3/core/helpers/extension.dart';
import 'package:untitled3/core/theming/app_text_style.dart';
import 'package:untitled3/generated/l10n.dart';
import '../../../core/common_widgets/grid_view/grid_view_sgimmer.dart';
import '../controller/favorites_cubit.dart';
import '../controller/favorites_state.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).Favorites,

        ),
      ),
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () {
              return   const GridShimmerLoading();
            },
            success: (favoriteModel, hasMore) {
              return GridViewWidget(
                result: favoriteModel,
                imageIsEmpty: 'assets/image/no_fav.png',

                textIsEmpty:  S.of(context).noFavoritesYet);
            },
            error: (error) {
              return Center(child: Text(error ?? ''));
            },
            orElse: () {
              return const SizedBox();
            },
          );
        },
      ),
    );
  }
}
