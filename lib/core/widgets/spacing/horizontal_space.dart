import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalSpace extends StatelessWidget {
  final double size;
  const HorizontalSpace(this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: size.w);
  }
}
