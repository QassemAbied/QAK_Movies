import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/common_widgets/rating_stars_widget.dart';
import 'package:untitled3/core/helpers/spacing.dart';
import 'package:untitled3/core/theming/theme_cubit/app_theme_cubit.dart';
import 'package:untitled3/features/all_movies/controller/all_movies_cubit.dart';
import 'package:untitled3/features/all_movies/controller/all_movies_state.dart';
import 'package:untitled3/features/all_movies/data/repos/all_movies_repos.dart';
import 'package:untitled3/features/all_movies/view/widgets/all_movies_list_view.dart';
import 'package:untitled3/features/all_movies/view/widgets/all_movies_shimmer.dart';
import 'package:untitled3/features/home/data/models/movies_category.dart';
import 'package:untitled3/generated/l10n.dart';
import '../../../core/di.dart';
import '../../../core/helpers/extension.dart';
import '../../../core/theming/app_text_style.dart';


class AllMoviesScreen extends StatefulWidget {
  final MovieCategory category;

  const AllMoviesScreen({super.key, required this.category});

  @override
  State<AllMoviesScreen> createState() => _AllMoviesScreenState();
}

class _AllMoviesScreenState extends State<AllMoviesScreen> {
  late AllMoviesCubit _cubit;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _cubit = AllMoviesCubit(
      allMoviesRepository: Sl<AllMoviesRepository>(),
      category: widget.category,
      language: AppThemeCubit.get(context).currentLanguage.code,
    )..loadFirstPage();


    _scrollController = ScrollController()
      ..addListener(_onScroll);
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final max = _scrollController.position.maxScrollExtent;
    final current = _scrollController.position.pixels;

    final threshold = max - 300;

    if (current >= threshold) {
      _cubit.loadMore();
    }
  }



  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:context.colors.surfaceContainerHighest,
          title: Text(
            switch (widget.category) {
              MovieCategory.popular    => S.of(context).title3,
              MovieCategory.nowPlaying => S.of(context).title4,
              MovieCategory.topRated   => S.of(context).title1,
              MovieCategory.upcoming   => S.of(context).title2,
            },
            style: AppTextStyles.bold(
                context,
                size: 25,
                color: context.colors.onSurface
            ),
          ),
        ),
        body: BlocBuilder<AllMoviesCubit, AllMoviesState>(
          buildWhen: (previous, current) =>
              current is Loading || current is Success || current is Error,
          builder: (context, state) {
            return state.maybeWhen(
              loading: () {
                return const AllMoviesShimmerList();
              },
              success: (movieModel, hasMore) {
                return AllMoviesWidget(
                    scrollController: _scrollController,
                  movieModel: movieModel,
                  hasMore: hasMore,
                );
              },
              error: (error) {
                return Center(child: Text(error.message ?? ''));
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

