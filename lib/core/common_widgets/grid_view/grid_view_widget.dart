import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:untitled3/core/helpers/extension.dart';
import 'package:untitled3/core/theming/app_text_style.dart';

import '../../../features/home/data/models/movies_response_models.dart';
import 'gird_view_item.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key, required this.result, required this.imageIsEmpty, required this.textIsEmpty});
  final List<MovieModel> result;
  final String imageIsEmpty;
  final String textIsEmpty;

  @override
  Widget build(BuildContext context) {
    return result.isNotEmpty? MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 10,
      cacheExtent: 2000,
      itemCount: result.length,
      itemBuilder: (context, index) {
        return GirdViewItem(result: result, index: index);
      },
    ):Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Image.asset(imageIsEmpty)),
        Text('$textIsEmpty\n',style: AppTextStyles.bold(context,
            size: 25, color: context.colors.onSurface),)
      ],
    );
  }
}
