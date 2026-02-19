import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled3/features/providers.dart';
import '../../../../core/helpers/extension.dart';
import '../../../../core/theming/app_text_style.dart';
import '../../data/models/movies_genres_models.dart';

class ItemGenresList extends StatelessWidget {
  const ItemGenresList({
    super.key,
    required this.selectId, required this.genres, required this.index,
  });
  final List<GenresModels> genres;
  final bool selectId;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      
      builder: (BuildContext context, WidgetRef ref, Widget? child) { 
        return  GestureDetector(
          onTap: () {
            ref.read(genresProvider('en').notifier)
                .changeGenre(genres[index].id!);


          },
          child: Transform.scale(
            scale: selectId ? 1.05 : 0.95,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),

              decoration: BoxDecoration(
                color: selectId
                    ? context.colors.primary
                    : context.colors.surface,
                borderRadius: BorderRadius.circular(17),
                border: Border.all(
                  color: context.colors.onSurface,
                  width: 2,
                ),
              ),
              child: Center(
                child: Text(
                  genres[index].name ?? '',
                  style: AppTextStyles.semiBold(
                    context,
                    size: 20,
                    color: selectId
                        ? context.colors.onSurface
                        : context.colors.onSurface,
                  ),
                ),
              ),
            ),
          ),
        );
      },
      
    );
  }
}
