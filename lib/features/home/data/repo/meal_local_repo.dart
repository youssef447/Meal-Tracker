import 'package:dartz/dartz.dart';
import 'package:meal_tracking/core/error_handler/error_handler_mixen.dart';
import 'package:meal_tracking/core/error_handler/failure.dart';

import 'package:meal_tracking/features/home/data/model/meal_model.dart';

import '../service/meal_local_service.dart';

class MealLocalRepo with ErrorHandlerMixen {
  final MealLocalService mealLocalService;
  MealLocalRepo({
    required this.mealLocalService,
  });

  Future<Either<Failure, List<MealModel>>> getMeals() async {
    return handleDatabaseErrors(() async {
      final data = await mealLocalService.getMeals();
      final result = data.map((e) => MealModel.fromMap(e)).toList();
      return result;
    });
  }

  Future addMeal(MealModel model) async {
    return handleDatabaseErrors(() async {
      await mealLocalService.saveMeal(model.toMap());
    });
  }

  Future deleteMeal(int id) async {
    return handleDatabaseErrors(() async {
      await mealLocalService.deleteMeal(id);
    });
  }
}
