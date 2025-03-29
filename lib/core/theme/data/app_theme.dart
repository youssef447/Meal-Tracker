import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract class AppTheme {
  static const Color _darkBackground = Color(0xff081028);
  static const Color _background = Color(0Xffe6edf5);
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: _darkBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: _darkBackground,
      scrolledUnderElevation: 0,
      centerTitle: true,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(AppColors.primary),
      checkColor: WidgetStateProperty.all(Colors.white),
      side: BorderSide.none,
      visualDensity: const VisualDensity(
        horizontal: -4,
        vertical: -4,
      ),
      materialTapTargetSize: MaterialTapTargetSize.padded,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      overlayColor: WidgetStateProperty.all(
        Colors.transparent,
      ),
    ),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      surface: _darkBackground,

      onPrimary: Colors.white, // Text/icon color on primary
      surfaceContainer: Color(0xff0b1739),
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.aBeeZee(color: Colors.white),
      displayMedium: GoogleFonts.cairo(color: Colors.white),
    ),
  );

  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: _background,
    appBarTheme: const AppBarTheme(
      backgroundColor: _background,
      scrolledUnderElevation: 0,
      centerTitle: true,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(AppColors.primary),
      checkColor: WidgetStateProperty.all(Colors.white),
      side: BorderSide.none,
      visualDensity: const VisualDensity(
        horizontal: -4,
        vertical: -4,
      ),
      materialTapTargetSize: MaterialTapTargetSize.padded,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      overlayColor: WidgetStateProperty.all(
        Colors.transparent,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      surface: Color(0xff081028),
      onPrimary: Colors.white, // Text/icon color on primary
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.aBeeZee(color: Colors.black),
      displayMedium: GoogleFonts.cairo(color: Colors.black),
    ),
  );
}
