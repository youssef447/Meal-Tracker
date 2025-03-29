import 'package:dio/dio.dart';
import 'package:meal_tracking/core/services/remote/dio_service.dart';

import '../../../../core/constants/api_constants.dart';

class MealRemoteService {
  Future<Response> searchMeals(String name) async {
    return await DioService.getData(
      method: ApiConstants.search,
      query: {'s': name},
    );
  }

  Future<Response> filterMeals(String category) async {
    return await DioService.getData(
      method: ApiConstants.filter,
      query: {'c': category},
    );
  }
}
