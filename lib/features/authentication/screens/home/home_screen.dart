import 'package:dicoding_restaurant_app/features/authentication/controllers/home/home_controller.dart';
import 'package:dicoding_restaurant_app/features/authentication/screens/home/detail_screen.dart';
import 'package:dicoding_restaurant_app/utils/constants/colors.dart';
import 'package:dicoding_restaurant_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final RestaurantController controller = Get.put(RestaurantController());

  @override
  Widget build(BuildContext context) {
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
        () => Column(
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
            Expanded(
              child: ListView.builder(
                itemCount: controller.restaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = controller.restaurants[index];
                  return ListTile(
                    onTap: () {
                      Get.to(
                        () => DetailScreen(restaurant: restaurant),
                      );
                    },
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    leading: Image.network(
                      restaurant.pictureId,
                      width: 100,
                      height: 100,
                      errorBuilder: (ctx, error, _) => const Center(
                        child: Icon(
                          Icons.error,
                        ),
                      ),
                    ),
                    title: Text(
                      restaurant.name,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 20,
                              color: DColors.primary,
                            ),
                            const SizedBox(
                              width: DSizes.xs,
                            ),
                            Text(
                              restaurant.city,
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
                              restaurant.rating.toString(),
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
        ),
      ),
    );
  }
}
