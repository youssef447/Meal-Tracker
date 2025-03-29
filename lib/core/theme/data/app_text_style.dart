import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTextStyles {
  static TextStyle font20BoldABeeZeeText(BuildContext context) =>
      Theme.of(context)
          .textTheme
          .displayLarge!
          .copyWith(fontSize: 20.sp, fontWeight: FontWeight.bold);
  static TextStyle font18BoldText(BuildContext context) => Theme.of(context)
      .textTheme
      .displayMedium!
      .copyWith(fontSize: 18.sp, fontWeight: FontWeight.bold);
  static TextStyle font16BoldText(BuildContext context) => Theme.of(context)
      .textTheme
      .displayMedium!
      .copyWith(fontSize: 16.sp, fontWeight: FontWeight.bold);
  static TextStyle font14BoldText(BuildContext context) => Theme.of(context)
      .textTheme
      .displayMedium!
      .copyWith(fontSize: 14.sp, fontWeight: FontWeight.bold);

  static TextStyle fieldStyle(BuildContext context) => Theme.of(context)
      .textTheme
      .displayMedium!
      .copyWith(fontSize: 14.sp, fontWeight: FontWeight.bold);
  static TextStyle font14RegularText(BuildContext context) => Theme.of(context)
      .textTheme
      .displayMedium!
      .copyWith(fontSize: 14.sp, fontWeight: FontWeight.normal);
  static TextStyle hintStyle(BuildContext context) =>
      Theme.of(context).textTheme.displayMedium!.copyWith(
          fontSize: 14.sp, fontWeight: FontWeight.w100, color: Colors.grey);

  static TextStyle font12BoldText(BuildContext context) => Theme.of(context)
      .textTheme
      .displayMedium!
      .copyWith(fontSize: 12.sp, fontWeight: FontWeight.bold);

  static TextStyle font12RegularText(BuildContext context) => Theme.of(context)
      .textTheme
      .displayMedium!
      .copyWith(fontSize: 12.sp, fontWeight: FontWeight.normal);
  static TextStyle font10BoldText(BuildContext context) => Theme.of(context)
      .textTheme
      .displayMedium!
      .copyWith(fontSize: 10.sp, fontWeight: FontWeight.bold);
}
