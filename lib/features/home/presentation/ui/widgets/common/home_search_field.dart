import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/widgets/form_field/app_form_field.dart';
import '../../../controller/home_search_controller.dart';

class HomeSearchField extends GetView<HomeSearchController> {
  final bool enabled;
  const HomeSearchField({
    super.key,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return AppFormField(
      enabled: enabled,
      controller: controller.searchController,
      onChanged: (value) {
        controller.getMeals(value);
      },
      hintText: 'Search for meals...',
      suffixIcon: Icon(
        Icons.search,
        size: 20.sp,
      ),
    );
  }
}
