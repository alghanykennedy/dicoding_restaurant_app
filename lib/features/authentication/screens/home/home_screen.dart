import 'package:dicoding_restaurant_app/features/authentication/controller/home/home_controller.dart';
import 'package:dicoding_restaurant_app/features/authentication/screens/home/detail_screen.dart';
import 'package:dicoding_restaurant_app/features/authentication/services/notification_services.dart';
import 'package:dicoding_restaurant_app/utils/constants/colors.dart';
import 'package:dicoding_restaurant_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/api_constants.dart';
import '../../../../utils/constants/image_strings.dart';
import '../noInternet/no_internet_connection.dart';

DateTime scheduleTime = DateTime.now();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RestaurantController controller = Get.put(RestaurantController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "D'Resto",
          style: TextStyle(
            color: DColors.textWhite,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              // Show time picker and wait for user input
              TimeOfDay? pickedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );

              // Check if the user canceled the time picker
              if (pickedTime == null) {
                return;
              }

              // Handle the picked time, for example, assign it to a variable
              DateTime selectedDateTime = DateTime(
                DateTime.now().year,
                DateTime.now().month,
                DateTime.now().day,
                pickedTime.hour,
                pickedTime.minute,
              );

              // Check if the selected time is in the future, if not, add a day
              if (selectedDateTime.isBefore(DateTime.now())) {
                selectedDateTime =
                    selectedDateTime.add(const Duration(days: 1));
              }

              // Update scheduleTime with the selected time
              scheduleTime = selectedDateTime;

              // Debug print the scheduled time
              debugPrint('Notification Scheduled for $scheduleTime');

              // Schedule the notification only if the selected time is in the future
              if (selectedDateTime.isAfter(DateTime.now())) {
                NotificationServices().scheduleNotification(
                  title: "It's Time To Eat! 🍱",
                  body: "Don't Miss a Chance Checkout our Top Best Restaurant!",
                  scheduledNotificationDateTime: scheduleTime,
                );
                Get.snackbar(
                  'Notifications Set',
                  'You will receive a notifications at $scheduleTime',
                  snackPosition: SnackPosition.BOTTOM,
                );
              }
            },
            icon: const Icon(
              Icons.notifications,
              size: 30,
              color: DColors.white,
            ),
          ),
        ],
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: DColors.primary,
      ),
      body: Obx(
        () => controller.connectionStatus.value == 1
            ? controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(
                      color: DColors.primary,
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Explore Restaurant',
                                style: TextStyle(
                                  color: Color(0xFF1F2937),
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                              SizedBox(
                                width: 217,
                                child: Text(
                                  'Check your city Near by Restaurant',
                                  style: TextStyle(
                                    color: Color(0xFF6B7280),
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // searchField(),
                        Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      const Color(0xff1D1617).withOpacity(0.11),
                                  blurRadius: 40,
                                  spreadRadius: 0.0),
                            ],
                          ),
                          child: TextField(
                            focusNode: controller.focusNode,
                            controller: controller.keyword,
                            onSubmitted: (value) {
                              controller.filteredRestaurant();
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.all(15),
                              hintText: 'Search Restaurant',
                              hintStyle: const TextStyle(
                                color: Color(0xffDDDADA),
                                fontSize: 14,
                              ),
                              prefixIcon: const Padding(
                                padding: EdgeInsets.all(12),
                                child: Icon(Icons.search),
                              ),
                              suffixIcon: const SizedBox(
                                width: 100,
                                child: IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      VerticalDivider(
                                        color: Colors.black,
                                        indent: 10,
                                        endIndent: 10,
                                        thickness: 0.1,
                                      ),
                                      // Padding(
                                      //   padding: const EdgeInsets.all(8.0),
                                      //   child: Ico,
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        controller.restaurants.isEmpty &&
                                controller.keyword.text.isNotEmpty
                            ? Expanded(
                                child: SizedBox(
                                  height: Get.height,
                                  width: Get.width,
                                  child: controller.isLoadingSearch.value
                                      ? const Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CircularProgressIndicator(
                                              color: DColors.primary,
                                            ),
                                          ],
                                        )
                                      : Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 115,
                                              child: Image.asset(
                                                  DImages.upComingImage),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            const Text(
                                              'Restaurant not found',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w600,
                                                height: 0,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 7.0,
                                            ),
                                            const Text(
                                              'Please enter the Restaurant name or other keywords',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w400,
                                                height: 0,
                                              ),
                                            ),
                                          ],
                                        ),
                                ),
                              )
                            : Expanded(
                                child: controller.isLoadingSearch.value
                                    ? Expanded(
                                        child: SizedBox(
                                          height: Get.height,
                                          width: Get.width,
                                          child: const Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CircularProgressIndicator(
                                                color: DColors.primary,
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : ListView.builder(
                                        itemCount:
                                            controller.restaurants.length,
                                        itemBuilder: (context, index) {
                                          final restaurants =
                                              controller.restaurants[index];
                                          return ListTile(
                                            onTap: () async {
                                              await controller
                                                  .fetchDataDetailRestaurants(
                                                restaurants.id,
                                              );
                                              Get.to(
                                                () => const DetailScreen(),
                                              );
                                            },
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                              horizontal: 16.0,
                                              vertical: 8.0,
                                            ),
                                            leading: Image.network(
                                              Constants.imageUrl +
                                                  restaurants.pictureId,
                                              width: 100,
                                              height: 100,
                                              errorBuilder: (ctx, error, _) =>
                                                  const Center(
                                                child: Icon(
                                                  Icons.error,
                                                ),
                                              ),
                                            ),
                                            title: Text(
                                              restaurants.name,
                                            ),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.location_city,
                                                      size: 20,
                                                      color: DColors.primary,
                                                    ),
                                                    const SizedBox(
                                                      width: DSizes.xs,
                                                    ),
                                                    Text(
                                                      restaurants.city,
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: DSizes.sm,
                                                ),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.star,
                                                      size: 18,
                                                      color: DColors.yellow,
                                                    ),
                                                    const SizedBox(
                                                      width: DSizes.xs,
                                                    ),
                                                    Text(
                                                      restaurants.rating
                                                          .toString(),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            trailing: Obx(
                                              () => IconButton(
                                                onPressed: () {
                                                  controller.toggleFavorite(
                                                      restaurants);
                                                },
                                                icon: Icon(
                                                  controller.favoriteRestaurants
                                                          .any(
                                                              (favRestaurant) =>
                                                                  favRestaurant
                                                                      .id ==
                                                                  restaurants
                                                                      .id)
                                                      ? Icons.favorite
                                                      : Icons.favorite_border,
                                                  color: controller
                                                          .favoriteRestaurants
                                                          .any(
                                                              (favRestaurant) =>
                                                                  favRestaurant
                                                                      .id ==
                                                                  restaurants
                                                                      .id)
                                                      ? Colors.red
                                                      : null,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                              )
                      ])
            : const NoInternetConnection(),
      ),
    );
  }
}
