import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meal_tracking/core/theme/controller/app_theme_controller.dart';
import 'package:meal_tracking/core/theme/data/app_text_style.dart';

import '../../assets/app_assets.dart';
import '../../helpers/app_context.dart';
import '../../theme/data/app_colors.dart';

class AppDropdown extends StatelessWidget {
  const AppDropdown({
    super.key,
    required this.onChanged,
    required this.items,
    required this.textButton,
    this.value,
    this.customSpacing,
    this.menuWidth,
    this.width,
    this.height,
    this.textColor,
    this.splashColorOn = true,
  });

  final Function(dynamic) onChanged;
  final List<DropdownMenuItem> items;
  final String textButton;
  final dynamic value;
  final Widget? customSpacing;
  final bool splashColorOn;
  final Color? textColor;
  final double? height, width, menuWidth;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: splashColorOn ? AppColors.primary : Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          customButton: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              //color: Colors.grey[200],
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: AppColors.button,
              ),
              border: Border.all(
                color: Colors.transparent,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 6.w,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildDropdownText(context),
                  customSpacing ?? const SizedBox(),
                  SvgPicture.asset(
                    AppAssets.dropdown,
                    color: Get.find<AppThemeController>().isDark
                        ? Colors.white
                        : Colors.black,
                    width: 16.w,
                    height: 16.h,
                  )
                ],
              ),
            ),
          ),
          value: value,
          dropdownStyleData: DropdownStyleData(
            width: menuWidth,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: AppColors.background(AppContext.getContext),
            ),
          ),
          /*  hint: Text(
            hintText,
            style: AppTextStyles.font12RegularText(context),
            overflow: TextOverflow.ellipsis,
          ), */
          items: items,
          onChanged: onChanged,
        ),
      ),
    );
  }

  Text _buildDropdownText(BuildContext context) {
    return Text(
      textButton,
      style: AppTextStyles.font12RegularText(context)
          .copyWith(color: Colors.white),
      /*  value != null
          ? AppTextStyles.font12RegularText(context)
              .copyWith(color: Colors.white)
          : AppTextStyles.font12RegularText(context)
              .copyWith(color: Colors.grey[200]),
 */
      overflow: TextOverflow.ellipsis,
    );
  }
}
