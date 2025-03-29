import 'package:get/get.dart';
import 'package:meal_tracking/core/constants/api_constants.dart';
import 'package:meal_tracking/core/services/local/app_cache_service.dart';
import 'package:meal_tracking/core/services/remote/dio_service.dart';
import 'package:meal_tracking/core/theme/controller/app_theme_controller.dart';
import 'package:meal_tracking/features/home/data/repo/meal_local_repo.dart';
import 'package:meal_tracking/features/home/data/repo/meal_remote_repo.dart';
import 'package:meal_tracking/features/home/data/service/meal_local_service.dart';
import 'package:meal_tracking/features/home/presentation/controller/home_page_controller.dart';

import '../../features/add_meal/controller/add_meal_controller.dart';
import '../../features/home/data/service/meal_remote_service.dart';
import '../../features/home/presentation/controller/home_search_controller.dart';

Future<void> configureDependencies() async {
  DioService.init(baseUrl: ApiConstants.baseUrl);
  await Get.putAsync<AppThemeController>(() async {
    final controller = AppThemeController();
    await controller.getCurrentTheme();
    return controller;
  });
  await AppCacheService.init();
  Get.lazyPut(
    () => HomePageController(
      mealLocalRepo: MealLocalRepo(
        mealLocalService: MealLocalService(),
      ),
    ),
    fenix: true,
  );
  Get.lazyPut(
    () => HomeSearchController(
      mealRemoteRepo: MealRemoteRepo(
        mealRemoteService: MealRemoteService(),
      ),
    ),
    fenix: true,
  );
  Get.lazyPut(
    () => AddMealController(
      mealLocalRepo: MealLocalRepo(
        mealLocalService: MealLocalService(),
      ),
    ),
  );
}
