import 'dart:ui';

import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static TextStyle _base({
    required BuildContext context,
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
  }) {
    return TextStyle(
      color: color,
      fontSize: getResponsiveFontSize(
        context,
        fontSize: fontSize,
      ),
      fontWeight: fontWeight,
    );
  }

  static TextStyle bold(
      BuildContext context, {
        required double size,
        required Color color,
      }) {
    return _base(
      context: context,
      fontSize: size,
      fontWeight: FontWeight.w700,
      color: color,
    );
  }

  static TextStyle semiBold(
      BuildContext context, {
        required double size,
        required Color color,
      }) {
    return _base(
      context: context,
      fontSize: size,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle medium(
      BuildContext context, {
        required double size,
        required Color color,
      }) {
    return _base(
      context: context,
      fontSize: size,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static TextStyle regular(
      BuildContext context, {
        required double size,
        required Color color,
      }) {
    return _base(
      context: context,
      fontSize: size,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }
}

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = scaleFactor * fontSize;
  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  final width = MediaQuery.sizeOf(context).width;
  if (width < 600) {
    return width / 400;
  } else if (width < 1000) {
    return width / 700;
  } else {
    return width / 1000;
  }
}