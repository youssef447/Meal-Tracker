import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract class AppTheme {
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.darkBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBackground,
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
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
      surface: AppColors.darkBackground,

      onPrimary: Colors.white, // Text/icon color on primary
      surfaceContainer: const Color(0xff0b1739),
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.aBeeZee(color: Colors.white),
      displayMedium: GoogleFonts.cairo(color: Colors.white),
      displaySmall: GoogleFonts.cairo(color: Colors.white),
      headlineLarge: GoogleFonts.cairo(color: Colors.white),
      headlineMedium: GoogleFonts.cairo(color: Colors.white),
      headlineSmall: GoogleFonts.aBeeZee(color: Colors.white),
    ),
  );

  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
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
      surfaceContainer: Color(0xff0b1739),
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.aBeeZee(color: Colors.black),
      displayMedium: GoogleFonts.cairo(color: Colors.black),
      displaySmall: GoogleFonts.cairo(color: Colors.black),
      headlineLarge: GoogleFonts.cairo(color: Colors.black),
      headlineMedium: GoogleFonts.cairo(color: Colors.black),
      headlineSmall: GoogleFonts.aBeeZee(color: Colors.black),
    ),
  );
}
