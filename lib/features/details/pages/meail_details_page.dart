import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_tracking/core/extensions/context_extension.dart';
import 'package:meal_tracking/core/routes/app_routes.dart';
import 'package:meal_tracking/core/theme/data/app_text_style.dart';
import 'package:meal_tracking/core/widgets/animations/horizontal_animation.dart';
import 'package:meal_tracking/core/widgets/animations/scale_animation.dart';
import 'package:meal_tracking/core/widgets/spacing/vertical_space.dart';
import 'package:meal_tracking/features/home/data/model/meal_model.dart';

import '../../../core/theme/data/app_colors.dart';

class MealDetailsPage extends StatelessWidget {
  final MealModel model;
  const MealDetailsPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Meal Details',
        style: AppTextStyles.font18BoldText(context),
      )),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Hero(
                      tag: model.id!,
                      child: CachedNetworkImage(
                        imageUrl: model.networkImage!,
                        height: 280.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        progressIndicatorBuilder: (context, url, progress) {
                          return Padding(
                            padding: EdgeInsets.all(8.0.w),
                            child: Center(
                              child: CircularProgressIndicator(
                                backgroundColor: AppColors.background(context),
                                strokeWidth: 2.0,
                                color: AppColors.primary,
                                value: progress.progress,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    PositionedDirectional(
                      bottom: 0,
                      end: 0,
                      start: 0,
                      child: SlideAnimation(
                        leftToRight: true,
                        delay: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.r),
                            topRight: Radius.circular(25.r),
                          ),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 5,
                              sigmaY: 5,
                            ),
                            child: Container(
                              height: 85.h,
                              width: double.infinity,
                              padding: EdgeInsets.all(8.w),
                              color: Colors.black.withOpacity(0.12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        model.name,
                                        style: AppTextStyles.font16BoldText(
                                            context),
                                      ),
                                      Wrap(
                                        children: List.generate(
                                          model.tags.length,
                                          (index) => Text(
                                            '@${model.tags[index]}',
                                            style: AppTextStyles
                                                    .font12RegularText(context)
                                                .copyWith(color: Colors.blue),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const VerticalSpace(10),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Category: ',
                                          children: [
                                            TextSpan(
                                              text: model.category ?? 'NA',
                                              style: AppTextStyles
                                                      .font12BoldText(context)
                                                  .copyWith(color: Colors.red),
                                            ),
                                          ],
                                        ),
                                      ],
                                      style:
                                          AppTextStyles.font12BoldText(context),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.navigate(AppRoutes.adPlayer,
                            arguments: {'url': model.youtubeUrl});
                      },
                      child: Icon(
                        Icons.play_circle_outline,
                        size: 50.sp,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                if (model.instructions != null)
                  Padding(
                    padding: EdgeInsets.all(8.0.w),
                    child: ScaleAnimation(
                      child: Text(
                        model.instructions!,
                        style: AppTextStyles.font12RegularText(context),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
