import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/Bloc/HomeBloc/HomeBloc.dart';
import 'package:foodapp/Data/API/FoodAPI.dart';
import 'package:foodapp/Data/Repository/FoodRepository.dart';
import 'package:foodapp/Helper/Dio/DioClient.dart';
import 'package:foodapp/Helper/Routes/AppRoutes.dart';
import 'package:foodapp/Helper/Routes/PageEntity.dart';
import 'package:foodapp/Pages/Home/HomePage.dart';

class AppRouting {
  static final RouteObserver<Route> observer = RouteObserver();
  static List<String> history = [];

  static List<PageEntity> routes() {
    return [
      PageEntity(
        path: AppRoutes.home,
        page: const HomePage(),
        bloc: BlocProvider(
            create: (context) => HomeBloc(
                foodRepository:
                    FoodRepository(FoodAPI(dioClient: DioClient(Dio()))))),
      ),
      PageEntity(
        path: AppRoutes.login,
        page: const HomePage(),
        bloc: null,
      ),
    ];
  }

/*
  static List<dynamic> bloc() {
    return [
      BlocProvider(create: (_) => FoodBloc()),
    ];
  }
*/
  static List<dynamic> blocs(BuildContext context) {
    List<dynamic> blocList = <dynamic>[];
    for (var bloc in routes()) {
      if (bloc.bloc != null) {
        blocList.add(bloc.bloc);
      }
    }
    return blocList;
  }

  static MaterialPageRoute generateRouteSetting(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.path == settings.name);
      if (result.isNotEmpty) {
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    return MaterialPageRoute<void>(
        builder: (_) => const HomePage(), settings: settings);
  }
}
