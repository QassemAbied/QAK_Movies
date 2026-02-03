import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/core/helpers/spacing.dart';
import 'package:untitled3/core/theming/app_text_style.dart';
import '../../../../core/common_widgets/rating_stars_widget.dart';
import '../../../../core/network/api_constance.dart';
import '../../data/models/movies_response_models.dart';
import 'item_list_view_horizontal.dart';

class ListViewHorizontal extends StatelessWidget {
  final List<MovieModel>? results;
  const ListViewHorizontal({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.18,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final item = results?[index];
            final double rating = (item!.voteAverage?.ceil() ?? 0) / 2;
            return ItemListViewHorizontal(
                item: item, rating: rating);
          },
          itemCount: results!.length,
          separatorBuilder: (context, index) {
            return horizontalSpace(10);
          },
        ),
      ),
    );
  }
}





