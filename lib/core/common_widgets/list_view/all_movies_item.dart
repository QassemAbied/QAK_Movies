import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../add_favorites_icon.dart';
import '../add_watch_list_icon.dart';
import '../rating_stars_widget.dart';
import '../../helpers/extension.dart';
import '../../helpers/spacing.dart';
import '../../network/api_constance.dart';
import '../../theming/app_text_style.dart';
import '../../../features/home/data/models/movies_response_models.dart';

class AllMoviesItem extends StatelessWidget {
  const AllMoviesItem({
    super.key,
    required this.movieModel,
    required this.rating,
    required this.index,
  });

  final List<MovieModel> movieModel;
  final double rating;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildExpandedImage(),
            horizontalSpace(10),
            buildWidgetsColumnForAllMovies(
              movieModel: movieModel,
              index: index,
              rating: rating,
            ),
          ],
        ),
      ),
    );
  }

  Expanded buildExpandedImage() {
    return Expanded(
      child: CachedNetworkImage(
        imageUrl: ApiConstance.imagePath(movieModel[index].posterPath ?? ''),
        fit: BoxFit.contain,
        placeholder: (context, url) => SizedBox(
          child: Image.asset(
            'assets/image/86075-loading-upload-image.gif',
            fit: BoxFit.cover,
          ),
        ),

        errorWidget: (context, url, error) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade300,
          ),
          child: const Icon(Icons.broken_image),
        ),

        imageBuilder: (context, imageProvider) => ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
    );
  }
}

class buildWidgetsColumnForAllMovies extends StatelessWidget {
  const buildWidgetsColumnForAllMovies({
    super.key,
    required this.movieModel,
    required this.index,
    required this.rating,
  });

  final List<MovieModel> movieModel;
  final int index;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(10),
            Text(
              movieModel[index].title ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.bold(
                context,
                size: 20,
                color: context.colors.onSurface,
              ),
            ),
            verticalSpace(10),
            Text(
              movieModel[index].overview ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.regular(
                context,
                size: 16,
                color: context.colors.onSurfaceVariant,
              ),
            ),
            verticalSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RatingStars(rating: rating),
                Text(
                  '($rating)',
                  style: AppTextStyles.regular(
                    context,
                    size: 15,
                    color: context.colors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            verticalSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               AddFavoritesIcon( model: movieModel[index], id: movieModel[index].id??0,),
                AddWatchListIcon( model: movieModel[index], id: movieModel[index].id??0,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
