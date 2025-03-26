import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meal_tracking/core/helpers/validation_helper.dart';
import 'package:meal_tracking/core/widgets/buttons/app_default_button.dart';
import 'package:meal_tracking/core/widgets/form_field/label_form_field.dart';
import 'package:meal_tracking/core/widgets/spacing/vertical_space.dart';
import 'package:meal_tracking/features/add_meal/controller/add_meal_controller.dart';

import '../../../../core/theme/data/app_colors.dart';
import '../../../../core/theme/data/app_text_style.dart';
part '../widgets/image_card.dart';

class AddMealPage extends GetView<AddMealController> {
  const AddMealPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        controller.resetResources();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Add Meal',
            style: AppTextStyles.font18BoldText(context),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Form(
              key: controller.formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelFormField(
                      label: 'Meal Name',
                      controller: controller.nameController,
                      validator: ValidationHelper.empty,
                    ),
                    const VerticalSpace(35),
                    LabelFormField(
                      label: 'Meal Calories',
                      controller: controller.caloriesController,
                      keyboardType: TextInputType.number,
                      validator: ValidationHelper.empty,
                    ),
                    const VerticalSpace(35),
                    Text(
                      'Add Photo',
                      style: AppTextStyles.font14BoldText(context),
                    ),
                    const VerticalSpace(6),
                    const ImageCard(),
                    const VerticalSpace(50),
                    AppDefaultButton(
                      text: 'Save Meal',
                      onPressed: () {
                        controller.addMeal();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
