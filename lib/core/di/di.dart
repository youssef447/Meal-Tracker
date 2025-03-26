import 'package:get/get.dart';
import 'package:meal_tracking/core/services/app_cache_service.dart';
import 'package:meal_tracking/core/theme/controller/app_theme_controller.dart';
import 'package:meal_tracking/features/home/data/repo/meal_repo.dart';
import 'package:meal_tracking/features/home/data/service/meal_service.dart';
import 'package:meal_tracking/features/home/presentation/controller/home_page_controller.dart';

import '../../features/add_meal/controller/add_meal_controller.dart';

Future<void> configureDependencies() async {
  await Get.putAsync<AppThemeController>(() async {
    final controller = AppThemeController();
    await controller.getCurrentTheme();
    return controller;
  });
  await AppCacheService.init();
  Get.lazyPut(
    () => HomePageController(
      mealRepo: MealRepo(
        mealService: MealService(),
      ),
    ),
    fenix: true,
  );
  Get.lazyPut(
    () => AddMealController(
      mealRepo: MealRepo(
        mealService: MealService(),
      ),
    ),
  );
}
