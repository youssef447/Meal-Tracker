// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_tracking/core/widgets/loading/loading_dialog.dart';
import 'package:meal_tracking/features/home/enums/sort_enum.dart';
import 'package:showcaseview/showcaseview.dart';

import 'package:meal_tracking/core/services/app_cache_service.dart';
import 'package:meal_tracking/features/home/data/model/meal_model.dart';
import 'package:meal_tracking/features/home/data/repo/meal_repo.dart';

import '../../../../core/helpers/app_context.dart';

class HomePageController extends GetxController {
  final MealRepo mealRepo;
  HomePageController({
    required this.mealRepo,
  });
  @override
  void onInit() async {
    super.onInit();
    await getMeals();
    handleShowcase();
  }

  List<MealModel> filteredmeals = [];
  List<MealModel> allMeals = [];
  Map<int, bool> checkBoxes = {};
  bool loading = true;
  Future getMeals() async {
    final result = await mealRepo.getMeals();
    loading = false;
    result.fold((fail) {
      Get.snackbar('Error', fail.message);
    }, (r) {
      allMeals = r;
      //deep copy
      filteredmeals = r.map((e) => e).toList();

      for (var item in r) {
        checkBoxes[item.id!] = false;
      }
      update();
    });
  }

  deleteMeals() async {
    showLoadingIndicator();

    for (var entry in checkBoxes.entries) {
      if (entry.value) {
        final result = await mealRepo.deleteMeal(entry.key);
        result.fold((fail) {
          Get.snackbar('Error', fail.message);
          return;
        }, (r) {});
      }
    }

    hideLoadingIndicator();
    showCheckboxes = false;
    getMeals();
  }

  bool showCheckboxes = false;
  toggkeCheckBoxes() {
    showCheckboxes = !showCheckboxes;
    update();
  }

  updateCheckBox(int id) {
    checkBoxes[id] = !checkBoxes[id]!;
    update(['checkbox $id']);
  }

  resetCheckBoxes() {
    for (var item in allMeals) {
      checkBoxes[item.id!] = false;
    }
  }
  //-------- Showcase --------//

  final GlobalKey<State> showcaseTheme = GlobalKey<State>();
  final GlobalKey<State> showcaseAdd = GlobalKey<State>();
  handleShowcase() {
    if (AppCacheService.getData(key: 'launched') == null) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          ShowCaseWidget.of(AppContext.getContext!).startShowCase([
            showcaseTheme,
            showcaseAdd,
          ]);
          AppCacheService.saveData(key: 'launched', value: true);
        },
      );
    }
  }

  //-------- Filters --------//
  bool filterchanged = false;
  DateTime selectedDate = DateTime.now();
  filterMeals(DateTime date) {
    selectedDate = date;
    for (var meal in filteredmeals) {
      if (meal.time.year == date.year && meal.time.month == date.month) {
        return;
      }
    }
    filteredmeals = allMeals
        .where((meal) =>
            meal.time.year == date.year && meal.time.month == date.month)
        .toList();
    filterchanged = true;

    sortMeals(sortValue);
  }

  resetFilter() {
    filteredmeals = allMeals.map((e) => e).toList();
    selectedDate = DateTime.now();
    sortValue = SortEnum.time;
    filterchanged = false;
    update();
  }

  SortEnum sortValue = SortEnum.time;
  sortMeals(SortEnum value) {
    sortValue = value;
    switch (value) {
      case SortEnum.name:
        filteredmeals.sort((a, b) => a.name.compareTo(b.name));
        break;
      case SortEnum.time:
        filteredmeals.sort((a, b) => a.time.compareTo(b.time));
        break;
      case SortEnum.calories:
        filteredmeals.sort((a, b) => a.calories.compareTo(b.calories));
        break;
    }
    filterchanged = true;

    update();
  }
}
