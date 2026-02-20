import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled3/core/helpers/extension.dart';
import 'package:untitled3/features/search/view/search_screen.dart';
import '../../generated/l10n.dart';
import '../favorites/view/favorite_screen.dart';
import '../home/view/home_screen.dart';
import '../profile/view/settings_screen.dart';

class BottonNavScreen extends ConsumerWidget {
  BottonNavScreen({Key? key}) : super(key: key);
  final List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const FavoriteScreen(),
    const SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context, ref) {
    final currentIndex = ref.watch(bottonProvider);
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: screens),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: context.colors.primary,
        elevation: 0.0,
        currentIndex: currentIndex,
        onTap: (index) {
          ref.read(bottonProvider.notifier).state = index;
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            label: S.of(context).Home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: S.of(context).Search,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite),
            label: S.of(context).Favorite,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: S.of(context).settings,
          ),
        ],
      ),
    );
  }
}

final bottonProvider = StateProvider<int>((ref) => 0);
