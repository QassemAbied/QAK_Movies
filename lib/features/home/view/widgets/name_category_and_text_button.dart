import 'package:flutter/material.dart';

import '../../../../core/thiming/app_colors.dart';
import '../../../../core/thiming/app_text_style.dart';

class NameCategoryAndTextButton extends StatelessWidget {
  final String titleCategory;
  final VoidCallback seeMoreButton;
  const NameCategoryAndTextButton({super.key, required this.titleCategory, required this.seeMoreButton});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(titleCategory, style: AppTextStyles.
          bold(context, size: 20, color: AppColors.textPrimary),),
          TextButton(onPressed: seeMoreButton, child:  Text(
            'See More', style: AppTextStyles.
          medium(context, size: 20, color: AppColors.accentGreen),),)
        ],
      ),
    );
  }
}
