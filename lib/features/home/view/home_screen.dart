import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/helpers/extension.dart';
import 'package:untitled3/core/helpers/spacing.dart';
import 'package:untitled3/core/theming/theme_cubit/app_theme_cubit.dart';
import 'package:untitled3/core/theming/theme_eunm/them_eunm.dart';
import 'package:untitled3/features/home/controller/movies_cubit.dart';
import 'package:untitled3/features/home/controller/movies_state.dart';
import 'package:untitled3/features/home/view/widgets/carousel_widget.dart';
import 'package:untitled3/features/home/view/widgets/genres_list_view.dart';
import 'package:untitled3/features/home/view/widgets/lists_for_home.dart';
import 'package:untitled3/features/home/view/widgets/shimmer_home_screen.dart';
import '../../../core/theming/theme_cubit/app_theme_state.dart';
import '../controller/genres_cubit.dart';
import '../controller/genres_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (previous, current) =>
              current is Loading ||
              current is Success ||
              current is Error ||
              current is GenresLoading ||
              current is GenresSuccess ||
              current is GenresError,
          builder: (context, state) {
            return state.maybeWhen(
              loading: () {
                return const HomeShimmer();
              },
              success: (trend, nowPlay, upComing, popular, topRate) {
                return CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Row(
                          //   children: [
                          //     Column(
                          //       children: [
                          //         TextButton(
                          //           onPressed: () {
                          //             AppThemeCubit.get(
                          //               context,
                          //             ).selectThemeMode(AppThemeMode.light);
                          //           },
                          //           child: const Text('light'),
                          //         ),
                          //         TextButton(
                          //           onPressed: () {
                          //             AppThemeCubit.get(
                          //               context,
                          //             ).selectThemeMode(AppThemeMode.dark);
                          //           },
                          //           child: const Text('light'),
                          //         ),
                          //       ],
                          //     ),
                          //     Column(
                          //       children: [
                          //         TextButton(
                          //           onPressed: () {
                          //             AppThemeCubit.get(
                          //               context,
                          //             ).changeLanguage(AppLanguage.english);
                          //           },
                          //           child: const Text('english'),
                          //         ),
                          //         TextButton(
                          //           onPressed: () {
                          //             AppThemeCubit.get(
                          //               context,
                          //             ).changeLanguage(AppLanguage.arabic);
                          //           },
                          //           child: const Text('arabic'),
                          //         ),
                          //       ],
                          //     ),
                          //   ],
                          // ),

                          CarouselWidget(trend: trend),
                          verticalSpace(10),
                          const GenresListView(),
                          Expanded(
                            child: ListsForHome(
                              nowPlaying: nowPlay,
                              upcoming: upComing,
                              popular: popular,
                              topRated: topRate,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
      ),
    );
  }
}
