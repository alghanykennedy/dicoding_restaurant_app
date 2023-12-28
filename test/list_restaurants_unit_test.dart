import 'dart:convert';
import 'dart:io';

import 'package:dicoding_restaurant_app/features/authentication/model/restaurant_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('test 1', () {
    // The model should be able to receive the following data:
    final restaurant = RestaurantModel(
      id: '',
      name: '',
      description: '',
      pictureId: '',
      city: '',
      rating: 0.0,
      foods: [],
      drinks: [],
    );

    expect(restaurant.id, '');
    expect(restaurant.name, '');
    expect(restaurant.description, '');
    expect(restaurant.pictureId, '');
    expect(restaurant.city, '');
    expect(restaurant.rating, 0.0);
    expect(restaurant.foods, []);
    expect(restaurant.drinks, []);
  });

  test(
    'test 2',
    () {
      final file =
          File('test/test_resources/local_restaurant.json').readAsStringSync();
      final restaurant =
          RestaurantModel.fromJson(jsonDecode(file) as Map<String, dynamic>);

      expect(restaurant.id, '');
      expect(restaurant.name, '');
      expect(
        restaurant.description,
        '',
      );
      expect(
        restaurant.pictureId,
        '',
      );
      expect(
        restaurant.city,
        '',
      );
      expect(
        restaurant.rating,
        0.0,
      );
      expect(
        restaurant.foods,
        [],
      );
      expect(
        restaurant.drinks,
        [],
      );
    },
  );
}
