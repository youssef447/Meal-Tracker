import 'dart:typed_data';

class MealModel {
  int? id;
  String name;
  DateTime time;
  double calories;
  Uint8List? image;
  MealModel({
    this.id,
    required this.name,
    required this.time,
    required this.calories,
    this.image,
  });

  MealModel copyWith({
    int? id,
    String? name,
    DateTime? time,
    double? calories,
    Uint8List? image,
  }) {
    return MealModel(
      id: id ?? this.id,
      name: name ?? this.name,
      time: time ?? this.time,
      calories: calories ?? this.calories,
      image: image ?? this.image,
    );
  }

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
}
