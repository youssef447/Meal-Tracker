import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

class LoadingSearch extends StatelessWidget {
  const LoadingSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey,
      child: MasonryGridView.builder(
        crossAxisSpacing: 8.w,
        clipBehavior: Clip.none,
        mainAxisSpacing: 10.h,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: Colors.transparent),
          ),
          height: 100.h + Random().nextInt(200).h,
        ),
        itemCount: 24,
      ),
    );
  }
}
