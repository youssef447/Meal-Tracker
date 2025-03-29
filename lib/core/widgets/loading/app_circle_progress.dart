import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/data/app_colors.dart';

class AppCircleProgress extends StatelessWidget {
  const AppCircleProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 70.h,
        height: 70.h,
        child: CircularProgressIndicator(
          //valueColor: AlwaysStoppedAnimation<Color>(AppColors.secondaryPrimary),
          backgroundColor: AppColors.background(context),
          strokeWidth: 2.0,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
