import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meal_tracking/core/routes/route_generator.dart';
import 'package:showcaseview/showcaseview.dart';

import 'core/di/di.dart';
import 'core/helpers/app_context.dart';
import 'core/theme/controller/app_theme_controller.dart';

import 'features/home/presentation/ui/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_, child) {
          return ShowCaseWidget(builder: (context) {
            return GetBuilder<AppThemeController>(builder: (controller) {
              return GetMaterialApp(
                title: 'Meal Tracker',
                debugShowCheckedModeBanner: false,
                theme: controller.currentTheme,
                navigatorKey: AppContext.appNavKey,
                home: const HomePage(),
                onGenerateRoute: RouteGenerator.generateRoute,
              );
            });
          });
        });
  }
}
