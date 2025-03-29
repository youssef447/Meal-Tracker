import 'package:flutter/material.dart';
import 'package:meal_tracking/core/routes/route_navigation_helper.dart';
import 'package:meal_tracking/features/add_meal/ui/pages/add_meal_page.dart';
import 'package:meal_tracking/features/home/presentation/ui/pages/home_page.dart';
import 'package:meal_tracking/features/home/presentation/ui/pages/search_page.dart';

import '../../features/details/pages/meail_details_page.dart';
import '../../features/details/pages/youtube_player_page.dart';
import 'app_routes.dart';

abstract class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>? ?? {};
    final routeName = settings.name;

    // Define your routes with corresponding transitions
    switch (routeName) {
      case AppRoutes.home:
        return RouteNavigationHelper.buildPageRoute(
          const HomePage(),
          PageTransitionType.fade,
        );
      case AppRoutes.addMeal:
        return RouteNavigationHelper.buildPageRoute(
          const AddMealPage(),
          PageTransitionType.upFade,
        );
      case AppRoutes.searchMeal:
        return RouteNavigationHelper.buildPageRoute(
          const HomeSearchPage(),
          PageTransitionType.upFade,
        );
      case AppRoutes.detailsMeal:
        return RouteNavigationHelper.buildPageRoute(
          MealDetailsPage(model: args['model']),
          PageTransitionType.upFade,
        );
      case AppRoutes.adPlayer:
        return RouteNavigationHelper.buildPageRoute(
          YouTubePlayerPage(youtubeUrl: args['url']),
          PageTransitionType.upFade,
        );

      default:
        return RouteNavigationHelper.buildPageRoute(
          Scaffold(
              body: SafeArea(
            child: Center(child: Text('No route defined for $routeName')),
          )),
          PageTransitionType.fade,
        );
    }
  }
}
