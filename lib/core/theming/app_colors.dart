
import 'package:flutter/material.dart';

class AppColors {

  // =======================
  // 🔵 BRAND COLORS
  // =======================

  static const Color primary = Color(0xFF247CFF);
  static const Color primaryDark = Color(0xFF1B5EDC);
  static const Color primaryLight = Color(0xFF6FA3FF);

  static const Color secondary = Color(0xFF0BCC83);
  static const Color secondaryDark = Color(0xFF099E64);
  static const Color secondaryLight = Color(0xFF5EE7B7);

  // =======================
  // 🌙 DARK THEME
  // =======================

  static const Color darkBackground = Color(0xFF05111C);
  static const Color darkSurface = Color(0xFF0A1A2F);
  static const Color darkCard = Color(0xFF0F233A);

  static const Color darkTextPrimary = Color(0xFFE3E3E3);
  static const Color darkTextSecondary = Color(0xFF9AA5B1);
  static const Color darkBorder = Color(0xFF1E3350);

  // =======================
  // 🔆 LIGHT THEME
  // =======================

  static const Color lightBackground = Color(0xFFF7F9FC);
  static const Color lightSurface = Colors.white;
  static const Color lightCard = Color(0xFFF1F4F9);

  static const Color lightTextPrimary = Color(0xFF1C1C1C);
  static const Color lightTextSecondary = Color(0xFF6E6E6E);
  static const Color lightBorder = Color(0xFFE0E0E0);

  // =======================
  // ⭐ ACCENT
  // =======================

  static const Color star = Color(0xFFF0C938);
  static const Color danger = Color(0xFFE53935);
  static const Color success = Color(0xFF2ECC71);
  static const Color warning = Color(0xFFFFB300);
  static const Color info = Color(0xFF29B6F6);

  // =======================
  // 🌈 GRADIENTS
  // =======================

  static const LinearGradient blueGradient = LinearGradient(
    colors: [primary, primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient darkGradient = LinearGradient(
    colors: [darkSurface, darkBackground],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
