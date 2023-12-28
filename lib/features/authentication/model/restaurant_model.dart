// restaurant_model.dart
class RestaurantModel {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  final List<Menu> foods;
  final List<Menu> drinks;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.foods,
    required this.drinks,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      pictureId: json['pictureId'] ?? '',
      city: json['city'] ?? '',
      rating: json['rating'] != null ? json['rating'].toDouble() : 0.0,
      foods: (json['menus']?['foods'] as List<dynamic>?)
              ?.map((food) => Menu.fromJson(food))
              .toList() ??
          [],
      drinks: (json['menus']?['drinks'] as List<dynamic>?)
              ?.map((drink) => Menu.fromJson(drink))
              .toList() ??
          [],
    );
  }
}

class Menu {
  final String name;

  Menu({required this.name});

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      name: json['name'],
    );
  }
}
