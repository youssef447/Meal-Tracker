import 'package:dartz/dartz.dart';
import 'package:meal_tracking/core/error_handler/error_handler_mixen.dart';
import 'package:meal_tracking/core/error_handler/failure.dart';

import 'package:meal_tracking/features/home/data/model/meal_model.dart';

import '../service/meal_remote_service.dart';

class MealRemoteRepo with ErrorHandlerMixen {
  final MealRemoteService mealRemoteService;
  MealRemoteRepo({
    required this.mealRemoteService,
  });

  Future<Either<Failure, List<MealModel>>> searchMeals(String name) async {
    return handleDatabaseErrors(() async {
      final res = await mealRemoteService.searchMeals(name);
      if (res.data?['meals'] == null) return [];
      final result = (res.data?['meals'] as List<dynamic>)
          .map((e) => MealModel.fromRemoteMap(e))
          .toList();
      return result;
    });
  }

  Future<Either<Failure, List<MealModel>>> filterMeals(String category) async {
    return handleDatabaseErrors(() async {
      final res = await mealRemoteService.filterMeals(category);
      if (res.data?['meals'] == null) return [];

      final result = (res.data?['meals'] as List<dynamic>)
          .map((e) => MealModel.fromRemoteMap(e))
          .toList();
      return result;
    });
  }
}
