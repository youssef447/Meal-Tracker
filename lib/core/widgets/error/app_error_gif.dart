import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../assets/app_assets.dart';

class AppErrorGif extends StatelessWidget {
  final double? height;
  final double? width;
  final String errorMessage;
  final void Function() onRetry;
  const AppErrorGif({
    super.key,
    this.height,
    this.width,
    required this.onRetry,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LottieBuilder.asset(
          height: height ?? Get.height * 0.35,
          width: width,
          AppAssets.error,
          frameRate: const FrameRate(120),
        ),
        Text(
          'Error, $errorMessage',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(
          height: 15.h,
        ),
        TextButton.icon(
          onPressed: onRetry,
          icon: Icon(
            Icons.refresh_rounded,
            size: 18.sp,
          ),
          label: Text(
            'Retry',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ],
    );
  }
}
