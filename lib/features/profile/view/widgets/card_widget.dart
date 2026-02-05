import 'package:flutter/material.dart';

import '../../../../core/helpers/extension.dart';
import '../../../../core/theming/app_text_style.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.trailing,
  });
  final IconData icon;
  final String title;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: context.colors.primary),
        title: Text(
          title,
          style: AppTextStyles.bold(
            context,
            size: 22,
            color: context.colors.onSurface,
          ),
        ),
        trailing: trailing,
      ),
    );
  }
}
