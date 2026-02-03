import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/extension.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_style.dart';
import '../../../../core/theming/theme_cubit/app_theme_cubit.dart';
import '../../controller/genres_cubit.dart';
import '../../data/models/movies_genres_models.dart';

class ItemGenresList extends StatelessWidget {
  const ItemGenresList({
    super.key,
    required this.selectId, this.genres, required this.index,
  });
  final List<GenresModels>? genres;
  final bool selectId;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<GenreCubit>().changeGenre(
          genreId: genres![index].id!,
          language: context.read<AppThemeCubit>().currentLanguage.code,
        );
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
              genres?[index].name ?? '',
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
  }
}
