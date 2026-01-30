import 'package:flutter/material.dart';

import '../../../../core/helpers/extension.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_text_style.dart';
import '../../data/models/details_movies_response.dart';

class TitleAndOverview extends StatelessWidget {
  const TitleAndOverview({super.key, this.detailsMovies});
  final DetailsMoviesResponse? detailsMovies;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(10),
        if ((detailsMovies?.title ?? '').isNotEmpty) ...[
          Text(
            'Original Title',
            style: AppTextStyles.regular(
              context,
              size: 20,
              color: context.colors.onSurfaceVariant,
            ),
          ),
          verticalSpace(5.0),
          Text(
            detailsMovies?.title ?? '',
            style: AppTextStyles.medium(
              context,
              size: 20,
              color: context.colors.onSurface,
            ),
          ),
          verticalSpace(10),
        ],
        Text(
          'Overview',
          style: AppTextStyles.regular(
            context,
            size: 20,
            color: context.colors.onSurface,
          ),
        ),
        verticalSpace(5.0),
        if ((detailsMovies?.tagline ?? '').isNotEmpty) ...[
          Text(
            detailsMovies?.tagline ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.regular(
              context,
              size: 15,
              color: context.colors.onSurfaceVariant,
            ),
          ),
          verticalSpace(10.0),
        ],
        if ((detailsMovies?.overview ?? '').isNotEmpty) ...[
          Text(
            detailsMovies?.overview ?? '',
            maxLines: 10,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.regular(
              context,
              size: 18,
              color: context.colors.onSurface,
            ).copyWith(height: 1.4),
          ),
          verticalSpace(10),
        ],
      ],
    );
  }
}
