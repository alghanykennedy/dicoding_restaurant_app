import 'package:dicoding_restaurant_app/features/authentication/controllers/home/home_controller.dart';
import 'package:dicoding_restaurant_app/features/authentication/screens/home/detail_screen.dart';
import 'package:dicoding_restaurant_app/utils/constants/colors.dart';
import 'package:dicoding_restaurant_app/utils/constants/sizes.dart';
import 'package:dicoding_restaurant_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/api_constants.dart';
import '../../../../utils/constants/image_strings.dart';
import '../noInternet/no_internet_connection.dart';

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
                                height: DHelperFunctions.screenHeight(),
                                width: DHelperFunctions.screenWidth(),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 56,
                                    ),
                                    SizedBox(
                                      height: 115,
                                      child: Image.asset(DImages.upComingImage),
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
                                      'Silakan masukkan nama fitur atau kata kunci lainnya',
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
                              child: ListView.builder(
                                itemCount: controller.restaurants.length,
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
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 8.0),
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
                                              restaurants.rating.toString(),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                    ],
                  )
            : const NoInternetConnection(),
      ),
    );
  }
}
