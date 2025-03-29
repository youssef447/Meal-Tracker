import 'dart:typed_data';

class MealModel {
  int? id;
  String name;
  String? youtubeUrl;
  String? instructions;
  String? category;
  List<String> tags;
  DateTime? time;
  double? calories;
  Uint8List? image;
  String? networkImage;
  MealModel({
    this.id,
    required this.name,
    this.time,
    this.calories,
    this.category,
    this.image,
    this.tags = const [],
    this.youtubeUrl,
    this.instructions,
    this.networkImage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'time': time.toString(),
      'calories': calories,
      'image': image,
    };
  }

  factory MealModel.fromMap(Map map) {
    return MealModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      time: DateTime.parse(map['time'] as String),
      calories: map['calories'] as double,
      image: map['image'] as Uint8List,
    );
  }
  factory MealModel.fromRemoteMap(Map map) {
    return MealModel(
      id: map['idMeal'] != null ? int.parse(map['idMeal'] as String) : null,
      name: map['strMeal'] as String,
      networkImage: map['strMealThumb'] as String?,
      category: map['strCategory'] as String?,
      instructions: map['strInstructions'] as String?,
      youtubeUrl: map['strYoutube'] as String?,
    );
  }
}
