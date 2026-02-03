import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import '../../../home/data/models/movies_category.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.category});
  final MovieCategory category;
  @override
  Widget build(BuildContext context) {
    return Text(
      switch (category) {
        MovieCategory.popular => S.of(context).title3,
        MovieCategory.nowPlaying => S.of(context).title4,
        MovieCategory.topRated => S.of(context).title1,
        MovieCategory.upcoming => S.of(context).title2,
        MovieCategory.trend => S.of(context).title5,
      },

    );
  }
}
