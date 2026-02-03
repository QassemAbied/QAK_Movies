import 'package:flutter/material.dart';
import 'package:untitled3/generated/l10n.dart';

import '../../../../core/helpers/extension.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_style.dart';

class NameCategoryAndTextButton extends StatelessWidget {
  final String titleCategory;
  final VoidCallback seeMoreButton;
  const NameCategoryAndTextButton({super.key, required this.titleCategory, required this.seeMoreButton});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(titleCategory, style: AppTextStyles.
        bold(context, size: 20, color: context.colors.onSurface),),
        TextButton(onPressed: seeMoreButton, child:  Text(
         S.of(context).seeMore, style: AppTextStyles.
        medium(context, size: 20, color: context.colors.primary),),)
      ],
    );
  }
}
