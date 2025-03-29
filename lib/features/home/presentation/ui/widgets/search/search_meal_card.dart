import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_tracking/core/extensions/context_extension.dart';
import 'package:meal_tracking/core/routes/app_routes.dart';
import 'package:meal_tracking/core/widgets/spacing/vertical_space.dart';
import 'package:meal_tracking/features/home/data/model/meal_model.dart';

import '../../../../../../core/theme/data/app_colors.dart';
import '../../../../../../core/theme/data/app_text_style.dart';
import '../../../../../../core/widgets/animations/scale_animation.dart';

class SearchMealCard extends StatelessWidget {
  final MealModel model;
  const SearchMealCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleAnimation(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              context
                  .navigate(AppRoutes.detailsMeal, arguments: {'model': model});
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: Colors.transparent),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.inverseSurface,
                      offset: const Offset(0, 2),
                      blurRadius: 2,
                      blurStyle: BlurStyle.outer,
                    ),
                    BoxShadow(
                      color: Theme.of(context).colorScheme.inverseSurface,
                      offset: const Offset(1, 2),
                      blurRadius: 2,
                      blurStyle: BlurStyle.outer,
                    ),
                  ]),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (model.networkImage != null)
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.r),
                          topRight: Radius.circular(16.r)),
                      child: Hero(
                        tag: model.id!,
                        child: CachedNetworkImage(
                          imageUrl: model.networkImage!,
                          progressIndicatorBuilder: (context, url, progress) {
                            return Padding(
                              padding: EdgeInsets.all(8.0.w),
                              child: Center(
                                child: CircularProgressIndicator(
                                  backgroundColor:
                                      AppColors.background(context),
                                  strokeWidth: 2.0,
                                  color: AppColors.primary,
                                  value: progress.progress,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  Padding(
                    padding: EdgeInsets.all(5.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.name,
                          style: AppTextStyles.font14BoldText(context),
                        ),
                        const VerticalSpace(8),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text: 'Category: ', children: [
                                TextSpan(
                                  text: model.category ?? 'NA',
                                  style: AppTextStyles.font12BoldText(context)
                                      .copyWith(
                                    color: Colors.red,
                                  ),
                                ),
                              ]),
                            ],
                            style: AppTextStyles.font12BoldText(context),
                          ),
                        ),
                        const VerticalSpace(6),
                        Wrap(
                          children: List.generate(
                            model.tags.length,
                            (index) => Text(
                              '@${model.tags[index]}',
                              style: AppTextStyles.font12RegularText(context)
                                  .copyWith(color: Colors.blue),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
