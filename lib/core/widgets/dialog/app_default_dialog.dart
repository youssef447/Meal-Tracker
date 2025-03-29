import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:lottie/lottie.dart';
import 'package:meal_tracking/core/helpers/app_context.dart';
import 'package:meal_tracking/core/theme/data/app_colors.dart';

import '../../assets/app_assets.dart';
import '../../theme/data/app_text_style.dart';
import '../spacing/vertical_space.dart';

abstract class AppResultDialog {
  static Future success({
    required String msg,
    Function()? callback,
    bool? barrierDismissible,
  }) {
    return showGeneralDialog(
        barrierLabel: "",
        barrierDismissible: barrierDismissible ?? true,
        context: AppContext.getContext!,
        transitionDuration: const Duration(
          milliseconds: 400,
        ),
        pageBuilder: (_, __, ___) {
          Future.delayed(const Duration(seconds: 3), () {
            if (Navigator.of(AppContext.getContext!, rootNavigator: true)
                .canPop()) {
              Navigator.of(AppContext.getContext!, rootNavigator: true).pop();
              callback?.call();
            }
          });
          return Dialog(
            clipBehavior: Clip.none,
            insetPadding: EdgeInsets.zero,
            backgroundColor: AppColors.background(AppContext.getContext),
            elevation: 0,
            shadowColor: Colors.transparent,
            child: Padding(
              padding: EdgeInsets.all(8.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LottieBuilder.asset(
                    AppAssets.successful,
                    width: 80.w,
                    height: 80.h,
                  ),
                  const VerticalSpace(20),
                  Text(
                    'Sucess',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.font16BoldText(AppContext.getContext!),
                  ),
                  Text(
                    msg,
                    textAlign: TextAlign.center,
                    style:
                        AppTextStyles.font14RegularText(AppContext.getContext!),
                  ),
                ],
              ),
            ),
          );
        },
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return ScaleTransition(
            scale: animation,
            child: Opacity(
              opacity: animation.value,
              child: child,
            ),
          );
        });
  }

  static Future error({
    required String msg,
    bool? barrierDismissible,
  }) {
    return showGeneralDialog(
        barrierLabel: "",
        barrierDismissible: barrierDismissible ?? true,
        context: AppContext.getContext!,
        transitionDuration: const Duration(
          milliseconds: 400,
        ),
        pageBuilder: (_, __, ___) {
          Future.delayed(const Duration(seconds: 3), () {
            if (Navigator.of(AppContext.getContext!).canPop()) {
              Navigator.of(AppContext.getContext!, rootNavigator: true).pop();
            }
          });
          return Dialog(
            clipBehavior: Clip.none,
            insetPadding: EdgeInsets.zero,
            backgroundColor: AppColors.background(AppContext.getContext),
            elevation: 0,
            shadowColor: Colors.transparent,
            child: Padding(
              padding: EdgeInsets.all(8.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LottieBuilder.asset(
                    AppAssets.error,
                    width: 80.w,
                    height: 80.h,
                  ),
                  const VerticalSpace(20),
                  Text(
                    'Failed',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.font16BoldText(AppContext.getContext!),
                  ),
                  Text(
                    msg,
                    textAlign: TextAlign.center,
                    style:
                        AppTextStyles.font14RegularText(AppContext.getContext!),
                  ),
                ],
              ),
            ),
          );
        },
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return ScaleTransition(
            scale: animation,
            child: Opacity(
              opacity: animation.value,
              child: child,
            ),
          );
        });
  }
}
