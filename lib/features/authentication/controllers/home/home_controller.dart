import 'dart:async';

import 'package:dicoding_restaurant_app/features/authentication/model/restaurants_model.dart';
import 'package:dicoding_restaurant_app/features/authentication/services/restaurant_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../model/restaurants_detail_model.dart';

class RestaurantController extends GetxController {
  final RestaurantService _restaurantService = RestaurantService();
  // final restaurants = <RestaurantModel>[].obs;
  final RxList<RestaurantsModel> restaurants = <RestaurantsModel>[].obs;
  Rx<RestaurantsDetailModel?> detailRestaurants =
      Rx<RestaurantsDetailModel?>(null);
  TextEditingController keyword = TextEditingController();

  var isLoading = true.obs;
  var connectionStatus = 0.obs;

  late StreamSubscription<InternetConnectionStatus> _listener;

  @override
  void onInit() {
    super.onInit();
    // _fetchRestaurants();
    _fetchDataRestaurants();
    _listener = InternetConnectionChecker()
        .onStatusChange
        .listen((InternetConnectionStatus status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          connectionStatus.value = 1;
          break;
        case InternetConnectionStatus.disconnected:
          connectionStatus.value = 0;
          break;
      }
    });
  }

  @override
  void onClose() {
    _listener.cancel();
  }

  // void _fetchRestaurants() async {
  //   final List<RestaurantModel> fetchedRestaurants =
  //       await _restaurantService.getRestaurants();
  //   restaurants.value = fetchedRestaurants;
  // }

  void _fetchDataRestaurants() async {
    isLoading(true);

    try {
      isLoading(true);
      final List<RestaurantsModel> result =
          await _restaurantService.getRestaurantsService();
      restaurants.value = result;

      isLoading(false);
    } catch (e) {
      Get.snackbar("title", "$e");
      isLoading(false);
    }
  }

  Future<void> fetchDataDetailRestaurants(String id) async {
    isLoading(true);
    try {
      final RestaurantsDetailModel result =
          await _restaurantService.getDetailRestaurantsService(id);
      detailRestaurants.value = result;

      isLoading(false);
    } catch (e) {
      Get.snackbar("title", "$e");
      isLoading(false);
    }
  }

  void filteredRestaurant() async {
    var keywords = keyword.text.toLowerCase();
    var title = await _restaurantService.getRestaurantsService();
    var f = title
        .where((item) => item.name.toLowerCase().contains(keywords))
        .toList();

    restaurants.value = f;
  }
}
