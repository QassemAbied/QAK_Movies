import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    //super.key,
    required this.onTryAgainPressed,
  });

  final Function() onTryAgainPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: Image.asset(
              'assets/images/icon.png',
              width: double.infinity,
              height: 50,
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: onTryAgainPressed,
            style: ElevatedButton.styleFrom(
              // backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              'AppStrings.tryAgain',
              style: textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
