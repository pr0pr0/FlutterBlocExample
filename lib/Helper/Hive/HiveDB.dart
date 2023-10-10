import 'package:hive_flutter/hive_flutter.dart';

class HiveDB {
  Future<bool> isExists({required String boxName}) async {
    final openBox = await Hive.openBox(boxName);
    int length = openBox.length;
    if (length != 0) {
      return true;
    } else {
      return false;
    }
  }

 Future getBoxes<T>(String boxName) async {
    final openBox = await Hive.openBox(boxName);

    final boxList = openBox.values.toList();

    return boxList;
  }

   Future getBoxLength<T>(String boxName) async {
    final openBox = await Hive.openBox(boxName);

    final length = openBox.values.length;

    return length;
  }

  addOneBox<BranchModel>(items, String boxName) async {
    final openBox = await Hive.openBox(boxName);

    openBox.put(items.id, items);
  }

  Future addNotification<BranchModel>(items, String boxName) async {
    final openBox = await Hive.openBox(boxName);

    openBox.put(items.id, items);
  }

  Future<dynamic> getOneBox(String boxName, int key) async {
    final openBox = await Hive.openBox(boxName);
    return openBox.get(key);
  }

  deleteBox<Void>(String boxName, id) async {
    final openBox = await Hive.openBox(boxName);

    openBox.delete(id);
  }

  deleteBoxes<Void>(String boxName) async {
    final openBox = await Hive.openBox(boxName);

    openBox.deleteFromDisk();
  }
}
