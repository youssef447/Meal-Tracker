import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_tracking/core/theme/data/app_colors.dart';

class AppDefaultButton extends StatelessWidget {
  final Function()? onPressed;
  final String? text;
  final double? width;
  final double? radius;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final double? height;
  final Color? textColor, iconColor;
  final TextStyle? style;
  final Color borderColor;
  final String? icon;
  final BoxShape? shape;
  const AppDefaultButton({
    super.key,
    this.text,
    this.onPressed,
    this.width = double.infinity,
    this.padding,
    this.radius,
    this.color,
    this.textColor,
    this.height,
    this.iconColor,
    this.style,
    this.icon,
    this.borderColor = Colors.transparent,
    this.shape,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: shape == BoxShape.circle
              ? null
              : BorderRadius.circular(radius ?? 8.r),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: AppColors.button,
          ),
          shape: shape ?? BoxShape.rectangle,
        ),
        width: width,
        height: height ?? 40.h,
        padding: padding,
        child: shape == BoxShape.circle
            ? SvgPicture.asset(
                icon!,
                color: iconColor,
                width: 25.w,
                height: 25.h,
              )
            : Text(
                text!,
                style: style?.copyWith(color: textColor),
              ),
      ),
    );
  }
}
