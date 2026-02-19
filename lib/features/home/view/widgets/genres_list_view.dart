import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled3/features/home/view/widgets/shimmer_home_screen.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../providers.dart';
import 'item_genres_list.dart';
import 'list_view_horizontal.dart';

class GenresListView extends StatelessWidget {
  const GenresListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final genresData = ref.watch(genresProvider('en'));

        return genresData.when(
          data: (data) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final selectId =
                            data.genres[index].id == data.selectedGenreId;
                        return ItemGenresList(
                          selectId: selectId,
                          genres: data.genres??[],
                          index: index,
                        );
                      },
                      itemCount: data.genres?.length ?? 0,
                      separatorBuilder: (context, index) {
                        return horizontalSpace(10);
                      },
                    ),
                  ),
                ),
                verticalSpace(20),
                ListViewHorizontal(results: data.movies),
              ],
            );
          },
          error: (e, _) {
            return Text(e.toString());
          },
          loading: () {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sectionTitleShimmer(),
                SizedBox(height: 12),
                HorizontalListShimmer(),
              ],
            );
          },
        );
      },
    );
  }
}
