import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/core/routing/routers.dart';
import '../../../../core/common_widgets/rating_stars_widget.dart';
import '../../../../core/helpers/extension.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/network/api_constance.dart';
import '../../../../core/theming/app_text_style.dart';

class ItemListViewHorizontalWidget extends StatelessWidget {
  const ItemListViewHorizontalWidget({
    super.key,

    this.rating,
    this.image,
    this.heightForImage,
    this.widthForImage,
    this.title,
    this.showRated,
    this.id,
    this.showSubText,
    this.subText,
    this.showText, this.onTap,
  });
  final String? image;
  final double? heightForImage;
  final double? widthForImage;
  final String? title;
  final bool? showRated;
  final double? rating;
  final int? id;
  final bool? showSubText;
  final bool? showText;
  final String? subText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: ApiConstance.imagePath(image ?? ''),
              width: widthForImage,
              height: heightForImage,
              fit: BoxFit.fill,
              // width: 120,
              // height: MediaQuery.sizeOf(context).height * 0.12,
              // fit: BoxFit.cover,
              placeholder: (context, url) => SizedBox(
                width: widthForImage,
                height: heightForImage,
                child: Image.asset(
                  'assets/image/86075-loading-upload-image.gif',
                  fit: BoxFit.cover,
                ),
              ),

              errorWidget: (context, url, error) => Container(
                width: widthForImage,
                height: heightForImage,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade300,
                ),
                child: const Icon(Icons.broken_image),
              ),

              imageBuilder: (context, imageProvider) => Container(
                width: widthForImage,
                height: heightForImage,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: context.colors.onSurface, blurRadius: 5),
                    BoxShadow(
                      color: context.colors.onSurfaceVariant,
                      blurRadius: 5,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(image: imageProvider, fit: BoxFit.fill),
                ),
              ),
            ),
            if (showText == true) ...[
              verticalSpace(10),
             SizedBox(
                  width: widthForImage,
                  child: Text(

                    title ?? '',
                    //maxLines: 1,
                     overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bold(
                      context,
                      size: 20,
                      color: context.colors.onSurface,
                    ),
                  ),
                ),

            ],
            if (showSubText == true) ...[
              verticalSpace(0.5),
              SizedBox(
                width: widthForImage,
                child: Text(
                  subText ?? '',
                  // maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.regular(
                    context,
                    size: 16,
                    color: context.colors.onSurfaceVariant,
                  ),
                ),
              ),
            ],
            if (showRated == true) ...[
              SizedBox(
                width: widthForImage,
                child: Row(
                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 // crossAxisAlignment: CrossAxisAlignment.s,
                  children: [
                    RatingStars(rating: rating ?? 0.0),
                    horizontalSpace(10),
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
              ),
            ],
          ],
        ),
      ),
    );
  }
}
