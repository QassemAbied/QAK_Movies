import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/common_widgets/grid_view/grid_view_sgimmer.dart';
import 'package:untitled3/features/watch_list/controller/watch_list_cubit.dart';
import 'package:untitled3/features/watch_list/controller/watch_list_state.dart';

import '../../../core/common_widgets/grid_view/grid_view_widget.dart';
import '../../../core/helpers/extension.dart';
import '../../../core/theming/app_text_style.dart';
import '../../../generated/l10n.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).watchList,

        ),
      ),
      body: BlocBuilder<WatchListCubit, WatchListState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () {
              return const GridShimmerLoading();
            },
            success: (watchListModel, hasMore) {
              return GridViewWidget(
                result: watchListModel,
                imageIsEmpty: 'assets/image/no_watch.png',
                textIsEmpty: S.of(context).noWatchListYet,
             //   imageIsEmpty: 'assets/image/no_watch.png',
               // textIsEmpty: 'No WatchList Yet',
              );
            },
            error: (error) {
              return Center(child: Text(error));
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