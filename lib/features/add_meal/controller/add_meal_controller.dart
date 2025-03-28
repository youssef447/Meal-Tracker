import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meal_tracking/core/extensions/context_extension.dart';
import 'package:meal_tracking/core/widgets/dialog/app_default_dialog.dart';
import 'package:meal_tracking/features/home/data/model/meal_model.dart';
import 'package:meal_tracking/features/home/data/repo/meal_local_repo.dart';
import 'package:meal_tracking/features/home/presentation/controller/home_page_controller.dart';

import '../../../core/helpers/app_context.dart';
import '../../../core/widgets/loading/loading_dialog.dart';

class AddMealController extends GetxController {
  final MealLocalRepo mealLocalRepo;
  AddMealController({required this.mealLocalRepo});
  TextEditingController nameController = TextEditingController();
  TextEditingController caloriesController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  addMeal() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!formKey.currentState!.validate()) {
      return;
    }
    showLoadingIndicator();
    final MealModel model = MealModel(
      name: nameController.text,
      time: DateTime.now(),
      calories: double.parse(caloriesController.text),
      image: image?.readAsBytesSync(),
    );
    final result = await mealLocalRepo.addMeal(model);
    hideLoadingIndicator();

    result.fold((fail) {
      Get.snackbar('Error', fail.message);
    }, (r) {
      AppResultDialog.success(
        msg: 'Meal added successfully',
        callback: () {
          Get.find<HomePageController>().getMeals();
          AppContext.getContext!.pop();
        },
      );
    });
  }

  File? image;
  pickImage() async {
    final xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    image = File(xfile!.path);
    update();
  }

  resetResources() {
    image = null;
    nameController.clear();
    caloriesController.clear();
  }
}
