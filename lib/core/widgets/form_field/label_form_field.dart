import 'package:flutter/material.dart';
import 'package:meal_tracking/core/theme/data/app_text_style.dart';
import 'package:meal_tracking/core/widgets/form_field/app_form_field.dart';
import 'package:meal_tracking/core/widgets/spacing/vertical_space.dart';

class LabelFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  const LabelFormField({
    super.key,
    required this.label,
    required this.controller,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.font14BoldText(context),
        ),
        const VerticalSpace(10),
        AppFormField(
          controller: controller,
          hintText: 'Enter ${label.toLowerCase()}',
          keyboardType: keyboardType,
          validator: validator,
        ),
      ],
    );
  }
}
