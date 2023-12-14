import 'dart:convert';

import 'package:flutter/services.dart';

import '../model/restaurant_model.dart';

class RestaurantService {
  Future<List<RestaurantModel>> getRestaurants() async {
    final String data =
        await rootBundle.loadString('assets/json/local_restaurant.json');
    final List<dynamic> jsonList = json.decode(data)['restaurants'];
    return jsonList.map((json) => RestaurantModel.fromJson(json)).toList();
  }
}
