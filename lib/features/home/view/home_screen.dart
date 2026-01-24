import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/helpers/spacing.dart';
import 'package:untitled3/features/all_movies/view/all_movies_screen.dart';
import 'package:untitled3/features/home/controller/movies_cubit.dart';
import 'package:untitled3/features/home/controller/movies_state.dart';
import 'package:untitled3/features/home/data/models/movies_category.dart';
import 'package:untitled3/features/home/view/widgets/carousel_widget.dart';
import 'package:untitled3/features/home/view/widgets/genres_list_view.dart';
import 'package:untitled3/features/home/view/widgets/list_view_horizontal.dart';
import 'package:untitled3/features/home/view/widgets/name_category_and_text_button.dart';
import 'package:untitled3/features/home/view/widgets/shimmer_home_screen.dart';
import '../controller/genres_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                return HomeShimmer();
              },
              success: (nowPlay, popular, upComing, topRate) {
                return CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CarouselWidget(popular: popular),
                          verticalSpace(10),
                          GenresListView(),
                          verticalSpace(10),
                          NameCategoryAndTextButton(
                            titleCategory: 'Top Reacted',
                            seeMoreButton: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return AllMoviesScreen(
                                      category: MovieCategory.topRated,
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                          verticalSpace(10),
                          ListViewHorizontal(results: topRate),
                          verticalSpace(10),
                          NameCategoryAndTextButton(
                            titleCategory: 'Up Coming',
                            seeMoreButton: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return AllMoviesScreen(
                                      category: MovieCategory.upcoming,
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                          verticalSpace(10),
                          ListViewHorizontal(results: upComing),
                          verticalSpace(10),
                          NameCategoryAndTextButton(
                            titleCategory: 'Popular',
                            seeMoreButton: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return AllMoviesScreen(
                                      category: MovieCategory.popular,
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                          verticalSpace(10),
                          ListViewHorizontal(results: popular),
                          verticalSpace(10),
                          NameCategoryAndTextButton(
                            titleCategory: 'Playing Now',
                            seeMoreButton: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return AllMoviesScreen(
                                      category: MovieCategory.nowPlaying,
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                          verticalSpace(10),
                          ListViewHorizontal(results: nowPlay),
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
                return SizedBox();
              },
            );
          },
        ),
      ),
    );
  }
}
