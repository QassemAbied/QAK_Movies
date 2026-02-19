import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled3/core/helpers/spacing.dart';
import 'package:untitled3/features/home/view/widgets/carousel_widget.dart';
import 'package:untitled3/features/home/view/widgets/genres_list_view.dart';
import 'package:untitled3/features/home/view/widgets/lists_for_home.dart';
import 'package:untitled3/features/home/view/widgets/shimmer_home_screen.dart';
import 'package:untitled3/features/providers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final homeState = ref.watch(homeProvider('en'));

            return homeState.when(
              data: (homeData) {
                return CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CarouselWidget(trend: homeData.trend),
                          verticalSpace(10),
                          const GenresListView(),
                          Expanded(
                            child: ListsForHome(
                              nowPlaying: homeData.nowPlaying,
                              upcoming: homeData.upcoming,
                              popular: homeData.popular,
                              topRated: homeData.topRated,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              error: (e, _) {
                return Center(child: Text(e.toString() ?? ''));
              },
              loading: () {
                return const HomeShimmer();
              },
            );
          },
        ),
      ),
    );
  }
}
