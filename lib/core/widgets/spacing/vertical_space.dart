import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerticalSpace extends StatelessWidget {
  final double size;
  const VerticalSpace(this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size.h);
  }
}
