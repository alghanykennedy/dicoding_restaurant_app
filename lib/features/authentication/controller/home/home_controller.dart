import 'dart:async';
import 'dart:convert';

import 'package:dicoding_restaurant_app/features/authentication/model/restaurants_model.dart';
import 'package:dicoding_restaurant_app/features/authentication/services/restaurant_services.dart';
import 'package:dicoding_restaurant_app/features/favorite/model/favorite_restaurant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../model/restaurants_detail_model.dart';

class RestaurantController extends GetxController {
  RestaurantService _restaurantService = RestaurantService(http.Client());
  final RxList<RestaurantsModel> restaurants = <RestaurantsModel>[].obs;
  Rx<RestaurantsDetailModel?> detailRestaurants =
      Rx<RestaurantsDetailModel?>(null);
  RxList<FavoriteRestaurant> favoriteRestaurants = <FavoriteRestaurant>[].obs;
  final RxBool isLoadingSearch = false.obs;

  final FocusNode focusNode = FocusNode();

  TextEditingController keyword = TextEditingController();

  var isLoading = true.obs;
  var connectionStatus = 0.obs;
  static const String favoriteRestaurantsKey = 'favoriteRestaurants';

  late StreamSubscription<InternetConnectionStatus> _listener;

  set restaurantService(RestaurantService service) {
    _restaurantService = service;
  }

  @override
  void onInit() {
    super.onInit();
    _loadFavoriteRestaurants();
    fetchDataRestaurants();
    _listener = InternetConnectionChecker().onStatusChange.listen(
      (InternetConnectionStatus status) {
        switch (status) {
          case InternetConnectionStatus.connected:
            connectionStatus.value = 1;
            break;
          case InternetConnectionStatus.disconnected:
            connectionStatus.value = 0;
            break;
        }
      },
    );
    focusNode.addListener(_focusNode);
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.removeListener(_focusNode);
    focusNode.dispose();
  }

  @override
  void onClose() {
    _listener.cancel();
  }

  void _focusNode() {
    if (focusNode.hasFocus == true) {
      isLoadingSearch.value = true;
    } else {
      isLoadingSearch.value = false;
    }
  }

  Future<void> fetchDataRestaurants() async {
    isLoading(true);

    try {
      final List<RestaurantsModel> result =
          await _restaurantService.getRestaurantsService();
      restaurants.value = result;
      isLoading(false);
    } catch (e) {
      if (connectionStatus.value == 0) {
        Get.snackbar(
            "title", "Internet not found please check your connection");
      } else {
        Get.snackbar("title", "$e");
      }
      if (kDebugMode) {
        print('Error fetching restaurants: $e');
      }
      restaurants.clear();
      isLoading(false);
    }
  }

  void _saveFavoriteRestaurants() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStringList =
        favoriteRestaurants.map((fav) => json.encode(fav.toJson())).toList();

    prefs.setStringList(favoriteRestaurantsKey, jsonStringList);
  }

  void _loadFavoriteRestaurants() async {
    final prefs = await SharedPreferences.getInstance();
    final savedFavorites = prefs.getStringList(favoriteRestaurantsKey);

    if (savedFavorites != null) {
      favoriteRestaurants.value = savedFavorites
          .map((jsonString) =>
              FavoriteRestaurant.fromJson(json.decode(jsonString)))
          .toList();
    }
  }

  Future<void> fetchDataDetailRestaurants(String id) async {
    isLoading(true);
    try {
      if (connectionStatus.value == 1) {
        final RestaurantsDetailModel result =
            await _restaurantService.getDetailRestaurantsService(id);
        detailRestaurants.value = result;
      } else {
        Get.snackbar(
            "title", "Internet not found please check your connection");
      }

      isLoading(false);
    } catch (e) {
      if (connectionStatus.value == 1) {
        Get.snackbar(
            "title", "Internet not found please check your connection");
      } else {
        Get.snackbar("title", "$e");
      }
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

  bool _isRestaurantSaved(RestaurantsModel restaurant) {
    return favoriteRestaurants
        .any((favRestaurant) => favRestaurant.id == restaurant.id);
  }

  void toggleFavorite(RestaurantsModel restaurant) {
    final isSaved = _isRestaurantSaved(restaurant);

    if (isSaved) {
      removeFromFavorites(restaurant);
    } else {
      _addToFavorites(restaurant);
    }

    favoriteRestaurants.refresh();
    _saveFavoriteRestaurants();
  }

  void _addToFavorites(RestaurantsModel restaurant) {
    final favorite = FavoriteRestaurant(
      id: restaurant.id,
      name: restaurant.name,
      description: restaurant.description,
      pictureId: restaurant.pictureId,
      city: restaurant.city,
      rating: restaurant.rating,
    );

    favoriteRestaurants.add(favorite);
  }

  void removeFromFavorites(RestaurantsModel restaurant) {
    favoriteRestaurants
        .removeWhere((favRestaurant) => favRestaurant.id == restaurant.id);
  }
}
