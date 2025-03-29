import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_tracking/features/home/data/repo/meal_remote_repo.dart';

import '../../data/model/meal_model.dart';

class HomeSearchController extends GetxController {
  final MealRemoteRepo mealRemoteRepo;

  HomeSearchController({
    required this.mealRemoteRepo,
  });
  List<MealModel> meals = [];
  final TextEditingController searchController = TextEditingController();

  getMeals(String value) {
    if (enableCategoryFilter) {
      filterMeals(value);
    } else {
      searchMeals(value);
    }
  }

  bool loading = false;

  searchMeals(String value) async {
    if (value.isNotEmpty) {
      loading = true;
      update(['home']);
      final result = await mealRemoteRepo.searchMeals(value);

      meals = result.fold((l) {
        Get.snackbar('Error', l.message);
        return [];
      }, (r) => r);

      loading = false;

      update(['home']);
    }
  }

  filterMeals(String value) async {
    if (value.isNotEmpty) {
      loading = true;
      update(['home']);
      final result = await mealRemoteRepo.filterMeals(value);

      meals = result.fold((l) {
        Get.snackbar('Error', l.message);
        return [];
      }, (r) => r);

      loading = false;

      update(['home']);
    }
  }

  //----------Category-------------
  bool enableCategoryFilter = false;
  toggleCategoryFilter() {
    enableCategoryFilter = !enableCategoryFilter;
    update(['category']);

    if (searchController.text.isNotEmpty) {
      getMeals(searchController.text);
    }
  }

  resetResources() {
    searchController.clear();
    meals = [];
    enableCategoryFilter = false;
  }
}
