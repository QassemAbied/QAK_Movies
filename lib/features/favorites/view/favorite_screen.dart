import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled3/core/common_widgets/grid_view/grid_view_widget.dart';
import 'package:untitled3/core/helpers/extension.dart';
import 'package:untitled3/features/providers.dart';
import 'package:untitled3/generated/l10n.dart';
import '../../../core/common_widgets/grid_view/grid_view_sgimmer.dart';
import '../../../core/theming/settings_controller/settings_riverpod.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).Favorites)),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final lang = ref.watch(appSettingsProvider).locale;

          final favState = ref.watch(favProvider(lang.code));

          return favState.when(
            data: (favoriteModel) {
              return GridViewWidget(
                result: favoriteModel.favoritesMovies,
                imageIsEmpty: 'assets/image/no_fav.png',

                textIsEmpty: S.of(context).noFavoritesYet,
              );
            },
            error: (error, _) {
              return Center(child: Text(error.toString() ?? ''));
            },
            loading: () {
              return const GridShimmerLoading();
            },
          );
        },
      ),
    );
  }
}
