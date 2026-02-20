import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled3/features/home/data/models/movies_response_models.dart';
import 'package:untitled3/features/providers.dart';
import '../../features/favorites/data/models/add_favorite_request.dart';
import '../helpers/extension.dart';
import '../theming/settings_controller/settings_riverpod.dart';

class AddFavoritesIcon extends StatelessWidget {
  const AddFavoritesIcon({super.key, required this.id, this.model});

  final int id;
  final MovieModel? model;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final lang = ref.watch(appSettingsProvider).locale;
        final favState = ref.watch(favProvider(lang.code));

        final isFav = favState.maybeWhen(
          data: (data) => data.favId.contains(id),
          orElse: () => false,
        );
        return Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: context.colors.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: context.colors.onSurface, width: 2),
          ),
          child: Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                if (isFav) {
                  ref
                      .read(favProvider(lang.code).notifier)
                      .removeFav(
                        addFavoriteRequest: AddFavoriteRequest(
                          "movie",
                          id ?? 0,
                          false,
                        ),
                      );
                } else {
                  ref
                      .read(favProvider(lang.code).notifier)
                      .addFavorites(
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
                color: isFav ? Colors.red : context.colors.onSurfaceVariant,
              ),
            ),
          ),
        );
      },
    );

  }
}
