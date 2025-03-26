import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../theme/data/app_colors.dart';

class DefaultSwitchButton extends StatelessWidget {
  const DefaultSwitchButton({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.6,
      child: FlutterSwitch(
        activeColor: AppColors.primary,
        inactiveColor: AppColors.lightGrey,
        value: value,
        onToggle: onChanged,
        // width: 40.w,
        //  height: 30.h,
      ),
    );
  }
}
