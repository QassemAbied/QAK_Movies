import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theming/settings_controller/settings_riverpod.dart';
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
      return Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text("English"),
              onTap: () {
                ref.read(appSettingsProvider.notifier).selectLanguage(AppLanguage.english);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("العربية"),
              onTap: () {
                ref.read(appSettingsProvider.notifier).selectLanguage(AppLanguage.arabic);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },);
    },
  );
}
