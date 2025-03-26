import 'package:meal_tracking/core/error_handler/error_handler_mixen.dart';
import 'package:meal_tracking/core/error_handler/failure.dart';
import 'package:meal_tracking/features/home/data/model/meal_model.dart';

import '../service/meal_service.dart';
import 'package:dartz/dartz.dart';

class MealRepo with ErrorHandlerMixen {
  final MealService mealService;
  MealRepo({
    required this.mealService,
  });

  Future<Either<Failure, List<MealModel>>> getMeals() async {
    return handleDatabaseErrors(() async {
      final data = await mealService.getMeals();
      final result = data.map((e) => MealModel.fromMap(e)).toList();
      return Right(result);
    });
  }

  Future<Either<Failure, bool>> addMeal(MealModel model) async {
    return handleDatabaseErrors(() async {
      await mealService.saveMeal(model.toMap());
      return const Right(true);
    });
  }

  Future<Either<Failure, bool>> deleteMeal(int id) async {
    return handleDatabaseErrors(() async {
      await mealService.deleteMeal(id);
      return const Right(true);
    });
  }
}
