import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_tracking/core/theme/data/app_colors.dart';
import 'package:meal_tracking/core/theme/data/app_text_style.dart';

class AppFormField extends StatelessWidget {
  const AppFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.showBorder,
    this.enabledBorder,
    this.textAlign,
    this.width,
    this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backGroundColor,
    this.onChanged,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.readOnly,
    this.enabled,
    this.onTap,
    this.top,
    this.bottom,
    this.maxLength,
    this.expands,
    this.keyboardType,
    this.autovalidateMode,
    this.height,
    this.labelText,
    this.minLines,
    this.maxLines,
    this.collapsed,
    this.textDirection,
    this.alignCounterTextLeft = false,
    this.showCounter = false,
    this.helperText,
  });

  final TextAlign? textAlign;
  final int? maxLength;
  final bool? collapsed;
  final EdgeInsetsGeometry? contentPadding;
  final Function(String)? onChanged;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;

  final String? hintText;
  final bool? isObscureText, readOnly, enabled, showBorder;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  final Color? backGroundColor;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final double? top, bottom;
  final double? height;
  final double? width;
  final AutovalidateMode? autovalidateMode;
  final void Function()? onTap;
  final bool? expands;
  final TextInputType? keyboardType;
  final String? labelText;
  final int? minLines;
  final int? maxLines;
  final TextDirection? textDirection;
  final bool alignCounterTextLeft;
  final bool showCounter;
  final String? helperText;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
        textDirection: textDirection,
        textInputAction: TextInputAction.done,
        keyboardType: keyboardType,
        expands: expands ?? false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onTap: onTap,
        controller: controller,
        onChanged: onChanged,
        minLines: minLines,
        maxLines: maxLines,
        readOnly: readOnly ?? false,
        enabled: enabled,
        maxLength: maxLength,
        textAlignVertical: TextAlignVertical.center,
        textAlign: textAlign ?? TextAlign.start,
        cursorColor: AppColors.primary,
        decoration: InputDecoration(
          helperText: helperText,
          hintStyle: AppTextStyles.hintStyle(context),
          isCollapsed: collapsed ?? true,
          errorStyle: AppTextStyles.font14RegularText(context)
              .copyWith(color: Colors.red),
          labelText: labelText,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide.none,
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide.none,
          ),
          enabledBorder: showBorder ?? false
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide.none,
                )
              : InputBorder.none,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          hintText: hintText,
          fillColor: backGroundColor ?? AppColors.primary.withOpacity(0.1),
          filled: true,
          suffixIcon: suffixIcon,
        ),
        style: AppTextStyles.fieldStyle(context),
        obscureText: isObscureText ?? false,
        validator: validator,
      
    );
  }
}
