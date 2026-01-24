import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/features/home/view/widgets/shimmer_home_screen.dart';
import '../../../../core/helpers/spacing.dart';
import '../../controller/genres_cubit.dart';
import '../../controller/genres_state.dart';
import 'item_genres_list.dart';
import 'list_view_horizontal.dart';

class GenresListView extends StatelessWidget {
  const GenresListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenreCubit, GenreState>(
      builder: (context, state) {
        return state.maybeWhen(
          genresLoading: () {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sectionTitleShimmer(),
                const SizedBox(height: 12),
                HorizontalListShimmer(),
              ],
            );
          },
          genresError: (e) {
            return Text(e.message);
          },
          genresSuccess: (genres, movieMode, int id) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final selectId = genres[index].id == id;
                        return ItemGenresList(selectId: selectId, genres: genres,index: index,);
                      },
                      itemCount: genres.length,
                      separatorBuilder: (context, index) {
                        return horizontalSpace(10);
                      },
                    ),
                  ),
                ),
                verticalSpace(20),
                ListViewHorizontal(results: movieMode),
              ],
            );
          },

          orElse: () {
            return SizedBox();
          },
        );
      },
    );
  }
}

