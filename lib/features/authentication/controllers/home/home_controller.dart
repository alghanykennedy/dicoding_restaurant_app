import 'package:dicoding_restaurant_app/features/authentication/model/restaurant_model.dart';
import 'package:dicoding_restaurant_app/features/authentication/services/restaurant_services.dart';
import 'package:get/get.dart';

class RestaurantController extends GetxController {
  final RestaurantService _restaurantService = RestaurantService();
  final restaurants = <RestaurantModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _fetchRestaurants();
  }

  void _fetchRestaurants() async {
    final List<RestaurantModel> fetchedRestaurants =
        await _restaurantService.getRestaurants();
    restaurants.value = fetchedRestaurants;
  }
}
