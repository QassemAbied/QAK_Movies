import 'package:flutter/material.dart';

import '../../../../core/common_widgets/list_view_horizontal_widget.dart';
import '../../../../core/helpers/extension.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_text_style.dart';
import '../../../home/data/models/movies_response_models.dart';
import '../../data/models/credits_response.dart';
import '../../data/models/images_movies_response.dart';

class ListsForDetails extends StatefulWidget {
  const ListsForDetails({super.key, this.credits, this.images, this.similar});
  final CreditsResponse? credits;
  final ImagesMoviesResponse? images;
  final MoviesResponse? similar;
  @override
  State<ListsForDetails> createState() => _ListsForDetailsState();
}

class _ListsForDetailsState extends State<ListsForDetails> {
  final ScrollController _imageController = ScrollController();
  final ScrollController _castController = ScrollController();
  final ScrollController _similarController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.images?.backdrops?.isNotEmpty ?? false) ...[
          Text(
            'Images For Movie',
            style: AppTextStyles.regular(
              context,
              size: 20,
              color: context.colors.onSurfaceVariant,
            ),
          ),
          verticalSpace(5),
          ListViewHorizontalWidget(
            items: widget.images?.backdrops ?? [],
            heightForListView: MediaQuery.sizeOf(context).height * 0.18,
            itemCount: widget.images?.backdrops?.length ?? 0,
            image: (m) => m.filePath ?? '',
            heightForImage: MediaQuery.sizeOf(context).height * 0.16,
            widthForImage: 150,
            controller: _imageController,
            widthPosition: 160,
            onTap: () {},
          ),
        ],
        if (widget.credits?.cast?.isNotEmpty ?? false) ...[
          Text(
            'Images For Cast',
            style: AppTextStyles.regular(
              context,
              size: 20,
              color: context.colors.onSurfaceVariant,
            ),
          ),
          verticalSpace(5),
          ListViewHorizontalWidget(
            items: widget.credits?.cast ?? [],
            heightForListView: MediaQuery.sizeOf(context).height * 0.3,
            itemCount: widget.credits?.cast?.length ?? 0,
            image: (m) => m.profilePath ?? '',
            heightForImage: MediaQuery.sizeOf(context).height * 0.2,
            widthForImage: 150,
            controller: _castController,
            widthPosition: 170,
            showText: true,
            title: (m) => m.name ?? '',
            showSubText: true,
            subText: (m) => m.originalName ?? '',
            onTap: () {},
          ),
        ],
        if (widget.similar?.results?.isNotEmpty ?? false) ...[
          Text(
            'Similar Movies',
            style: AppTextStyles.regular(
              context,
              size: 20,
              color: context.colors.onSurfaceVariant,
            ),
          ),
          verticalSpace(5.0),
          ListViewHorizontalWidget(
            items: widget.similar?.results ?? [],
            heightForListView: MediaQuery.sizeOf(context).height * 0.28,
            itemCount: widget.similar?.results?.length ?? 0,
            image: (m) => m.backdropPath ?? '',
            heightForImage: MediaQuery.sizeOf(context).height * 0.2,
            widthForImage: 180,
            controller: _similarController,
            widthPosition: 200,
            showText: true,
            title: (m) => m.title ?? '',
            showRated: true,
            rating: (m) => (m!.voteAverage?.ceil() ?? 0) / 2,
            onTap: () {},
          ),
        ],
      ],
    );
  }
}
