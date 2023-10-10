import 'package:dio/dio.dart';
import 'package:foodapp/Data/API/FoodAPI.dart';
import 'package:foodapp/Data/Model/FoodModel/FoodModel.dart';
import 'package:foodapp/Helper/Dio/DioExceptions.dart';

class FoodRepository {
  final FoodAPI foodApi;

  FoodRepository(this.foodApi);

  Future<List<FoodModel>> getFoodRequested({required int from}) async {
    try {
      final response = await foodApi.getFoodsApi(from: from);

      final foods = (response.data["results"] as List)
          .map((e) => FoodModel.fromJson(e))
          .toList();
      return foods;
    } on DioException catch (e) {
      throw DioExceptions.fromDioError(dioError: e);
    }
  }
}
