import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:get/get.dart';
import 'package:meal_tracking/core/services/app_cache_service.dart';
import 'package:meal_tracking/core/theme/data/app_colors.dart';

import '../data/app_theme.dart';

class AppThemeController extends GetxController {
  ThemeData currentTheme = AppTheme.lightTheme;
  bool isDark = false;

  @override
  void onInit() {
    super.onInit();
    getCurrentTheme();
  }

  getCurrentTheme() async {
    isDark = await AppCacheService.getData(key: 'isDark') ?? false;
    currentTheme = isDark ? AppTheme.darkTheme : AppTheme.lightTheme;
    await setPlatformColors();
    update();
  }

  changeTheme() async {
    isDark = !isDark;
    currentTheme = isDark ? AppTheme.darkTheme : AppTheme.lightTheme;
    await setPlatformColors();
    await AppCacheService.saveData(key: 'isDark', value: isDark);

    update();
  }

  Future<void> setPlatformColors() async {
    if (isDark) {
      await FlutterStatusbarcolor.setStatusBarColor(AppColors.darkBackground);
      await FlutterStatusbarcolor.setNavigationBarColor(
        AppColors.darkBackground,
      );

      FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);
      FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    } else {
      await FlutterStatusbarcolor.setNavigationBarColor(AppColors.background);
      await FlutterStatusbarcolor.setStatusBarColor(AppColors.background);

      FlutterStatusbarcolor.setNavigationBarWhiteForeground(false);
      FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    }
  }
}
