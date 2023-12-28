import 'dart:convert';
import 'package:dicoding_restaurant_app/utils/constants/api_constants.dart';
import 'package:http/http.dart' as http;

import '../model/restaurants_detail_model.dart';
import '../model/restaurants_model.dart';

class RestaurantService {
  final http.Client client;

  RestaurantService(this.client);

  Future<List<RestaurantsModel>> getRestaurantsService() async {
    final response = await client.get(Uri.parse(Constants.listRestaurant));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic> restaurant = jsonData['restaurants'];

      return restaurant.map((e) => RestaurantsModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load restaurants');
    }
  }

  Future<RestaurantsDetailModel> getDetailRestaurantsService(String id) async {
    final urlDetail = Constants.detailRestaurant + id;
    final response = await client.get(Uri.parse(urlDetail));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final restaurantDetail = RestaurantsDetailModel.fromJson(data);
      return restaurantDetail;
    } else {
      throw Exception('Failed to load restaurants');
    }
  }
}
