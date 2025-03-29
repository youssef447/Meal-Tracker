import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meal_tracking/core/assets/app_assets.dart';
import 'package:meal_tracking/core/extensions/context_extension.dart';
import 'package:meal_tracking/core/helpers/app_context.dart';
import 'package:meal_tracking/core/helpers/date_format_helper.dart';
import 'package:meal_tracking/core/theme/controller/app_theme_controller.dart';
import 'package:meal_tracking/core/widgets/animations/horizontal_animation.dart';
import 'package:meal_tracking/core/widgets/animations/scale_animation.dart';
import 'package:meal_tracking/core/widgets/buttons/app_default_button.dart';
import 'package:meal_tracking/core/widgets/loading/app_circle_progress.dart';
import 'package:meal_tracking/core/widgets/no_data/no_data.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:meal_tracking/core/widgets/spacing/vertical_space.dart';
import 'package:meal_tracking/features/home/data/model/meal_model.dart';
import 'package:meal_tracking/features/home/enums/sort_enum.dart';
import 'package:meal_tracking/features/home/presentation/controller/home_page_controller.dart';

import 'package:showcaseview/showcaseview.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/theme/data/app_colors.dart';
import '../../../../../core/theme/data/app_text_style.dart';
import '../../../../../core/widgets/buttons/default_switch_button.dart';
import '../../../../../core/widgets/dropdown/app_dropdown.dart';
import '../widgets/common/home_search_field.dart';

part '../widgets/home/appbar/home_appbar.dart';
part '../widgets/home/showcase/home_showcase.dart';
part '../widgets/home/cards/meal_card.dart';
part '../widgets/home/buttons/home_floating_button.dart';
part '../widgets/home/calendar_filter/home_calendar_filter.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (controller.showCheckboxes == false) {
          SystemNavigator.pop();
        } else {
          controller.toggkeCheckBoxes();
          controller.resetCheckBoxes();
        }
      },
      child: Scaffold(
        appBar: const HomeAppbar(),
        floatingActionButton: const HomeFloatingButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SafeArea(
          child: GetBuilder<HomePageController>(builder: (controller) {
            if (controller.loading) {
              return const AppCircleProgress();
            }
            if (controller.allMeals.isEmpty) {
              return const NoData();
            }
            return Padding(
              padding: EdgeInsets.all(8.w),
              child: NestedScrollView(
                clipBehavior: Clip.none,
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverToBoxAdapter(
                      child: GestureDetector(
                          onTap: () {
                            context.navigate(AppRoutes.searchMeal);
                          },
                          child: const HomeSearchField(enabled: false))),
                  const SliverToBoxAdapter(child: VerticalSpace(8)),
                  const SliverToBoxAdapter(child: CalenderFilter()),
                ],
                body: MasonryGridView.builder(
                  crossAxisSpacing: 8.w,
                  clipBehavior: Clip.none,
                  mainAxisSpacing: 10.h,
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) => MealCard(
                    model: controller.filteredmeals[index],
                  ),
                  itemCount: controller.filteredmeals.length,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
