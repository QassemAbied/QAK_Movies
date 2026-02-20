import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled3/features/home/data/models/movies_response_models.dart';
import 'package:untitled3/features/providers.dart';
import '../../features/watch_list/data/models/add_watch_list_requst.dart';
import '../helpers/extension.dart';
import '../theming/settings_controller/settings_riverpod.dart';

class AddWatchListIcon extends StatelessWidget {
  const AddWatchListIcon({super.key, required this.id, required this.model});

  final int? id;
  final MovieModel model;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final lang = ref.watch(appSettingsProvider).locale;
        final watchState = ref.watch(watchListProvider(lang.code));

        final isWatch = watchState.maybeWhen(
          data: (data) => data.watchId.contains(id),
          orElse: () => false,
        );
        return Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            border: Border.all(color: context.colors.onSurface, width: 2),
          ),
          child: Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                if (isWatch) {
                  ref
                      .read(watchListProvider(lang.code).notifier)
                      .removeWatchList(
                        adWatchListRequest: AddWatchListRequest(
                          "movie",
                          id ?? 0,
                          false,
                        ),
                      );
                } else {
                  ref
                      .read(watchListProvider(lang.code).notifier)
                      .addWatchList(
                        adWatchListRequest: AddWatchListRequest(
                          "movie",
                          id ?? 0,
                          true,
                        ),
                        movie: model,
                      );
                }
              },
              child: Icon(
                Icons.bookmark,
                color: isWatch
                    ? context.colors.primary
                    : context.colors.onSurfaceVariant,
              ),
            ),
          ),
        );
      },
    );
  }
}
