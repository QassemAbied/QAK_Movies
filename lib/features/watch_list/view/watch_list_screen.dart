import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled3/core/common_widgets/grid_view/grid_view_sgimmer.dart';
import 'package:untitled3/features/providers.dart';
import '../../../core/common_widgets/grid_view/grid_view_widget.dart';
import '../../../core/helpers/extension.dart';
import '../../../core/theming/settings_controller/settings_riverpod.dart';
import '../../../generated/l10n.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).watchList)),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final lang = ref.watch(appSettingsProvider).locale;
          final watchListState = ref.watch(watchListProvider(lang.code));
          return watchListState.when(
            data: (watchListModel) {
              return GridViewWidget(
                result: watchListModel.watchListMovies,
                imageIsEmpty: 'assets/image/no_watch.png',
                textIsEmpty: S.of(context).noWatchListYet,
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
