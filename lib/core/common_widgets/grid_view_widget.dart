import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../features/home/data/models/movies_response_models.dart';
import 'gird_view_item.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key, required this.result});
  final List<MovieModel> result;

  @override
  Widget build(BuildContext context) {
    return result.isNotEmpty? MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      cacheExtent: 2000,
      itemCount: result.length,
      itemBuilder: (context, index) {
        return GirdViewItem(result: result, index: index);
      },
    ):const Center(child: Text('Not Founf Favorite'));
  }
}
