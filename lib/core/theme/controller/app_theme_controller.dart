import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:get/get.dart';
import 'package:meal_tracking/core/services/local/app_cache_service.dart';

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
    await FlutterStatusbarcolor.setStatusBarColor(
        currentTheme.scaffoldBackgroundColor);
    await FlutterStatusbarcolor.setNavigationBarColor(
      currentTheme.scaffoldBackgroundColor,
    );
    if (isDark) {
      FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);
      FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    } else {
      FlutterStatusbarcolor.setNavigationBarWhiteForeground(false);
      FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    }
  }
}
