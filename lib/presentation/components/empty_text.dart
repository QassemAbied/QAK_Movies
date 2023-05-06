import 'package:flutter/material.dart';

class EmptyWatchlistText extends StatelessWidget {
  EmptyWatchlistText({key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '    AppStrings.watchlistIsEmpty',
          style: textTheme.titleMedium,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            ' AppStrings.watchlistText',
            style: textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
