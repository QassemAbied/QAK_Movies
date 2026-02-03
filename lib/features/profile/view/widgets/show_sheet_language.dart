import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/theme_cubit/app_theme_cubit.dart';
import '../../../../core/theming/theme_eunm/them_eunm.dart';

Future showModalBottom({required BuildContext context}){
  return showModalBottomSheet(
    context: context,
    shape:  const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text("English"),
            onTap: () {
              context.read<AppThemeCubit>()
                  .changeLanguage(AppLanguage.english);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text("العربية"),
            onTap: () {
              context.read<AppThemeCubit>()
                  .changeLanguage(AppLanguage.arabic);
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
