import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/core/routing/routers.dart';
import 'package:untitled3/core/theming/app_colors.dart';
import 'package:untitled3/core/theming/theme_cubit/app_theme_cubit.dart';
import 'package:untitled3/features/details_movies/controller/details_movies_cubit.dart';

import '../../../../core/common_widgets/rating_stars_widget.dart';
import '../../../../core/helpers/extension.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/network/api_constance.dart';
import '../../../../core/theming/app_text_style.dart';
import '../../data/models/movies_response_models.dart';

class ItemListViewHorizontal extends StatelessWidget {
  const ItemListViewHorizontal({
    super.key,
    required this.item,
    required this.rating,
  });

  final MovieModel? item;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.detailsMoviesScreen,
            arguments: item!.id);

      },
      child: FittedBox(
        child: SizedBox(
          width: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: ApiConstance.imagePath(
                  item?.backdropPath ?? '',
                ),
                width: 120,
                height: MediaQuery.sizeOf(context).height * 0.12,
                fit: BoxFit.cover,

                placeholder: (context, url) => SizedBox(
                  width: 120,
                  child: Image.asset(
                    'assets/image/86075-loading-upload-image.gif',
                    fit: BoxFit.cover,
                  ),
                ),

                errorWidget: (context, url, error) => Container(
                  width: 120,
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
              verticalSpace(0.5),
              Text(
                item?.title ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.medium(
                  context,
                  size: 17,
                  color: context.colors.onSurface,
                ),
              ),
              verticalSpace(0.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child:  RatingStars(rating: rating),
                    ),
                  ),
                  horizontalSpace(5),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text('($rating)',
                      style: AppTextStyles.regular(
                      context,
                      size: 15,
                      color:context.colors.onSurfaceVariant,
                    ),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
