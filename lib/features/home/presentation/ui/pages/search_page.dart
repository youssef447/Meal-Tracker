import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:meal_tracking/features/home/presentation/ui/widgets/common/home_search_field.dart';
import 'package:meal_tracking/features/home/presentation/ui/widgets/search/loading_search.dart';

import '../../../../../core/theme/data/app_text_style.dart';
import '../../../../../core/widgets/spacing/horizontal_space.dart';
import '../../../../../core/widgets/spacing/vertical_space.dart';
import '../../controller/home_search_controller.dart';
import '../widgets/search/search_meal_card.dart';

class HomeSearchPage extends GetView<HomeSearchController> {
  const HomeSearchPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        controller.resetResources();
      },
      child: Scaffold(
        appBar: AppBar(),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8.w),
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  const SliverToBoxAdapter(
                      child: HomeSearchField(enabled: true)),
                  const SliverToBoxAdapter(child: VerticalSpace(8)),
                  SliverToBoxAdapter(
                    child: Row(
                      children: [
                        Text(
                          'Filter by category',
                          style: AppTextStyles.font14BoldText(context),
                        ),
                        const HorizontalSpace(6),
                        GetBuilder<HomeSearchController>(
                          id: 'category',
                          builder: (controller) {
                            return Checkbox(
                                value: controller.enableCategoryFilter,
                                onChanged: (v) {
                                  controller.toggleCategoryFilter();
                                });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SliverToBoxAdapter(child: VerticalSpace(8)),
                ];
              },
              body: GetBuilder<HomeSearchController>(
                id: 'home',
                builder: (controller) {
                  if (controller.loading) {
                    return const LoadingSearch();
                  }

                  return MasonryGridView.builder(
                    crossAxisSpacing: 8.w,
                    clipBehavior: Clip.none,
                    mainAxisSpacing: 10.h,
                    padding: EdgeInsets.only(bottom: 8.w),
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) => SearchMealCard(
                      model: controller.meals[index],
                    ),
                    itemCount: controller.meals.length,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
