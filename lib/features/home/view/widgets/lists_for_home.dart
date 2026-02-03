import 'package:flutter/material.dart';

import '../../../../core/common_widgets/list_horizontal/list_view_horizontal_widget.dart';
import '../../../../core/helpers/extension.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routers.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/movies_category.dart';
import '../../data/models/movies_response_models.dart';
import 'name_category_and_text_button.dart';

class ListsForHome extends StatefulWidget {
  final List<MovieModel> nowPlaying;
  final List<MovieModel> upcoming;
  final List<MovieModel> popular;
  final List<MovieModel> topRated;
  const ListsForHome({super.key, required this.nowPlaying, required this.upcoming, required this.popular, required this.topRated});

  @override
  State<ListsForHome> createState() => _ListsForHomeState();
}

class _ListsForHomeState extends State<ListsForHome> {
  final ScrollController _topRatedController = ScrollController();
  final ScrollController _upComingController = ScrollController();
  final ScrollController _popularController = ScrollController();
  final ScrollController _nowPlayingController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 16),
      child: Column(
        children: [

          //1
          NameCategoryAndTextButton(
            titleCategory: S.of(context).title4,
            seeMoreButton: () {
              context.pushNamed(Routes.allMoviesScreen ,
                  arguments:MovieCategory.nowPlaying );
            },
          ),
          Expanded(
            child: ListViewHorizontalWidget(
              items:widget.nowPlaying,
              heightForListView: MediaQuery.sizeOf(context).height * 0.25,
              itemCount: widget.nowPlaying.length ?? 0,
              image: (m) => m.backdropPath ?? '',
              heightForImage: MediaQuery.sizeOf(context).height * 0.15,
              widthForImage: 140,
              controller: _nowPlayingController,
              widthPosition: 150,
              showText: true,
              title: (m) => m.title ?? '',
              showRated: true,
              rating: (m) => (m.voteAverage?.ceil() ?? 0) / 2,
              onTap: () {},
            ),
          ),
          //2
          NameCategoryAndTextButton(
            titleCategory: S.of(context).title2,
            seeMoreButton: () {
              context.pushNamed(Routes.allMoviesScreen ,
                  arguments:MovieCategory.upcoming );
            },
          ),
          Expanded(
            child: ListViewHorizontalWidget(
              items: widget.upcoming,
              heightForListView: MediaQuery.sizeOf(context).height * 0.25,
              itemCount:  widget.upcoming.length ?? 0,
              image: (m) => m.backdropPath ?? '',
              heightForImage: MediaQuery.sizeOf(context).height * 0.15,
              widthForImage: 140,
              controller: _upComingController,
              widthPosition: 150,
              showText: true,
              title: (m) => m.title ?? '',
              showRated: true,
              rating: (m) => (m.voteAverage?.ceil() ?? 0) / 2,
              onTap: () {},
            ),
          ),

          //3
          NameCategoryAndTextButton(
            titleCategory: S.of(context).title3,
            seeMoreButton: () {
              context.pushNamed(Routes.allMoviesScreen ,
                  arguments:MovieCategory.popular );
            },
          ),
          Expanded(
            child: ListViewHorizontalWidget(
              items: widget.popular,
              heightForListView: MediaQuery.sizeOf(context).height * 0.25,
              itemCount: widget.popular.length ?? 0,
              image: (m) => m.backdropPath ?? '',
              heightForImage: MediaQuery.sizeOf(context).height * 0.15,
              widthForImage: 140,
              controller: _popularController,
              widthPosition: 150,
              showText: true,
              title: (m) => m.title ?? '',
              showRated: true,
              rating: (m) => (m.voteAverage?.ceil() ?? 0) / 2,
              onTap: () {},
            ),
          ),
          //4
          NameCategoryAndTextButton(
            titleCategory: S.of(context).title1,
            seeMoreButton: () {
              context.pushNamed(Routes.allMoviesScreen ,
                  arguments:MovieCategory.topRated );
            },
          ),
          Expanded(
            child: ListViewHorizontalWidget(
              items: widget.topRated,
              heightForListView: MediaQuery.sizeOf(context).height * 0.25,
              itemCount:  widget.topRated.length ?? 0,
              image: (m) => m.backdropPath ?? '',
              heightForImage: MediaQuery.sizeOf(context).height * 0.15,
              widthForImage: 140,
              controller: _topRatedController,
              widthPosition: 150,
              showText: true,
              title: (m) => m.title ?? '',
              showRated: true,
              rating: (m) => (m.voteAverage?.ceil() ?? 0) / 2,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
