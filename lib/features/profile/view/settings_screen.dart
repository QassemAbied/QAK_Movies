import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled3/core/helpers/extension.dart';
import 'package:untitled3/core/helpers/spacing.dart';
import 'package:untitled3/core/routing/routers.dart';
import 'package:untitled3/features/profile/view/widgets/card_widget.dart';
import 'package:untitled3/features/profile/view/widgets/show_sheet_language.dart';
import '../../../core/theming/settings_controller/settings_riverpod.dart';
import '../../../core/theming/theme_eunm/them_eunm.dart';
import '../../../generated/l10n.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CardWidget(
              icon: Icons.person_outline_rounded,
              title: S.of(context).profile,
              trailing: GestureDetector(
                onTap: () {
                  context.pushNamed(Routes.profileScreen);
                },
                child: const Icon(Icons.arrow_forward_ios),
              ),
            ),
            verticalSpace(15.0),
            CardWidget(
              icon: Icons.bookmark_added_rounded,
              title: S.of(context).watchList,
              trailing: GestureDetector(
                onTap: () {
                  context.pushNamed(Routes.watchListScreen);
                },
                child: const Icon(Icons.arrow_forward_ios),
              ),
            ),

            verticalSpace(15.0),
            Consumer(
              builder: (context, ref, child) {
                final isDark =
                    Theme.of(context).brightness == Brightness.dark;

                return CardWidget(
                  icon: Icons.dark_mode,
                  title: S.of(context).theme,
                  trailing: Switch(
                    value: isDark,
                    onChanged: (value) {
                      ref.read(appSettingsProvider.notifier).selectThemeMode(
                        value ? AppThemeMode.dark : AppThemeMode.light,
                      );
                    },
                  ),
                );
              },
            ),

            verticalSpace(15.0),
            CardWidget(
              icon: Icons.language,
              title: S.of(context).language,
              trailing: GestureDetector(
                onTap: () {
                  showModalBottom(context: context);
                },
                child: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
