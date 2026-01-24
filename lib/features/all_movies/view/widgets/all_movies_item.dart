import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/common_widgets/rating_stars_widget.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/network/api_constance.dart';
import '../../../../core/thiming/app_colors.dart';
import '../../../../core/thiming/app_text_style.dart';
import '../../../home/data/models/movies_response_models.dart';

class AllMoviesItem extends StatelessWidget {
  const AllMoviesItem({
    super.key,
    required this.movieModel,
    required this.rating, required this.index,
  });

  final List<MovieModel> movieModel;
  final double rating;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildExpandedImage(),
        horizontalSpace(10),
        buildWidgetsColumnForAllMovies(
            movieModel: movieModel, index: index, rating: rating),
      ],
    );
  }

  Expanded buildExpandedImage() {
    return Expanded(
        child: CachedNetworkImage(
          imageUrl: ApiConstance.imagePath(
            movieModel[index].posterPath ?? '',
          ),
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
            child: Image(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
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
              color: AppColors.textPrimary,
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
              color: AppColors.textPrimary,
            ),
          ),
          verticalSpace(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RatingStars(rating:  rating),
              Text('(${rating})',
                style: AppTextStyles.regular(
                  context,
                  size: 15,
                  color: AppColors.textSecondary,
                ),),
            ],
          ),
          verticalSpace(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red,width: 2),

                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Icon(Icons.favorite, color: AppColors.textSecondary,),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
