import 'package:flutter/material.dart';
import 'package:untitled3/core/common_widgets/list_horizontal/item_list_view_horizontal_widget.dart';
import 'package:untitled3/core/helpers/spacing.dart';

class ListViewHorizontalWidget<T> extends StatelessWidget {
  final dynamic results;
  const ListViewHorizontalWidget({
    super.key,
    this.results,
    required this.heightForListView,
    required this.itemCount,
    required this.image,
    required this.heightForImage,
    required this.widthForImage,
    this.title,
    this.showRated=false,
    this.rating,
    this.id,
    this.showSubText=false,
    this.showText=false,
    this.subText,
    required this.controller,
    required this.widthPosition,
    required this.items,
    required this.onTap,
  });
  // final double? heightForListView;
  // final int itemCount;
  // final String? image;
  // final double? heightForImage;
  // final double? widthForImage;
  // final String? title;
  // final bool? showRated;
  // final double? rating;
  // final int? id;
  // final bool? showSubText;
  // final bool? showText;
  // final String? subText;
  // final ScrollController controller ;
  // final double? widthPosition;
  final List<T> items;
  final int itemCount;
  final ScrollController controller;
  final double widthPosition;
  final double heightForListView;
  final double heightForImage;
  final double widthForImage;
  final VoidCallback onTap;
  // extractors
  final String Function(T item) image;
  final String? Function(T item)? title;
  final String? Function(T item)? subText;
  final double? Function(T item)? rating;
  final int? Function(T item)? id;

  final bool showText;
  final bool showSubText;
  final bool showRated;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightForListView,
      child: ListView.separated(
        controller:controller ,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final item = items[index];
          //  final item = results?[index];
         //  final double rating = (item!.voteAverage?.ceil() ?? 0) / 2;
          return AnimatedBuilder(
              animation: controller,

              builder: (context , child) {
                double scale = 1.0;
                if (controller.hasClients &&controller.position.haveDimensions) {
                  final itemPosition = index * widthPosition;
                  final screenCenter =
                      controller.offset +
                          MediaQuery
                              .of(context)
                              .size
                              .width / 2;

                  final diff = (screenCenter - itemPosition).abs();

                  scale = (1 - (diff / 500)).clamp(0.85, 1.0);
                }

                return Transform.scale(
                  scale: scale,
                  child: child,
                );
              },


          child:   ItemListViewHorizontalWidget(
            id: id?.call(item),image: image(item),title: title?.call(item),subText: subText?.call(item),
            showRated: showRated,showSubText: showSubText,showText: showText,
            heightForImage: heightForImage,widthForImage: widthForImage,
            rating: rating?.call(item),onTap:onTap ,
          ),
          );
        },
        itemCount: itemCount,
        separatorBuilder: (context, index) {
          return horizontalSpace(5.0);
        },
      ),
    );
  }
}
