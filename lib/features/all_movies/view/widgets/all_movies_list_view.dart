import 'package:flutter/material.dart';
import 'package:untitled3/core/helpers/extension.dart';
import 'package:untitled3/core/routing/routers.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../home/data/models/movies_response_models.dart';
import 'all_movies_item.dart';
import 'all_movies_shimmer.dart';

class AllMoviesWidget extends StatelessWidget {
  const AllMoviesWidget({
    super.key,
    required ScrollController scrollController,
    required this.movieModel,
    required this.hasMore,
  }) : _scrollController = scrollController;
  final List<MovieModel> movieModel;
  final bool hasMore;
  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        controller: _scrollController,
        itemCount: movieModel.length + (hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == movieModel.length) {
            return const AllMoviesShimmerItem();
          }
          final double rating = (movieModel[index].voteAverage?.ceil() ?? 0) / 2;
          return GestureDetector(
            onTap: () {
              context.pushNamed(
                Routes.detailsMoviesScreen,
                arguments: movieModel[index].id ?? 0,
              );
            },
            child: AllMoviesItem(
              movieModel: movieModel,
              rating: rating,
              index: index,
            ),
          );
        },
        separatorBuilder: (context, index) {
          return verticalSpace(15);
        },
      ),
    );
  }
}
