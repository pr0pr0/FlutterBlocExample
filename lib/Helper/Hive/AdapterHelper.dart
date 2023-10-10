import 'package:foodapp/Data/Model/FoodModel/FoodModel.dart';
import 'package:hive_flutter/hive_flutter.dart';


class AdapterHelper {
  void adapter() {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(FoodModelAdapter());
    }
  }
}
