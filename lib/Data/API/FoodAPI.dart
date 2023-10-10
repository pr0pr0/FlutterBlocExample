import 'package:dio/dio.dart';
import 'package:foodapp/Helper/Dio/DioClient.dart';
import 'package:foodapp/Helper/Dio/Endpoints.dart';

class FoodAPI {
  final DioClient dioClient;

  FoodAPI({required this.dioClient});

  Future<Response> getFoodsApi({required int from}) async {
    try {
      final Response response = await dioClient.get(Endpoints.foodList,
          queryParameters: {
            'from': from,
            'size': 20,
          },
          options: Options(
            headers: {
              "X-RapidAPI-Key":
                  "a545dc67e5mshd5e8da5a562262bp16b9f1jsn42a39b3fdfdc",
              "X-RapidAPI-Host": "tasty.p.rapidapi.com"
            },
          ));
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
