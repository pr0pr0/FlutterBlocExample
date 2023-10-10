import 'package:hive_flutter/hive_flutter.dart';

part 'FoodModel.g.dart';

@HiveType(typeId: 0)
class FoodModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String urlImage;
  @HiveField(3)
  String country;
  @HiveField(4)
  String description;
  @HiveField(5)
  int totalTime;

  FoodModel({
    required this.id,
    required this.name,
    required this.urlImage,
    required this.country,
    required this.description,
    required this.totalTime,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        id: json['id'],
        name: json['name'] ?? "",
        urlImage: json['thumbnail_url'] ?? "",
        country: json['country'] ?? "",
        description: json['description'] ?? "",
        totalTime: json['total_time_minutes'] ?? 00,
      );
}
