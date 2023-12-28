import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/api_constants.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../authentication/controller/home/home_controller.dart';
import '../../authentication/screens/home/detail_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RestaurantController controller = Get.put(RestaurantController());

    return Scaffold(
      body: Obx(
        () => ListView.builder(
          itemCount: controller.favoriteRestaurants.length,
          itemBuilder: (context, index) {
            final favRestaurants = controller.favoriteRestaurants[index];
            return ListTile(
              onTap: () async {
                await controller.fetchDataDetailRestaurants(
                  favRestaurants.id,
                );
                Get.to(
                  () => const DetailScreen(),
                );
              },
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              leading: Image.network(
                Constants.imageUrl + favRestaurants.pictureId,
                width: 100,
                height: 100,
                errorBuilder: (ctx, error, _) => const Center(
                  child: Icon(
                    Icons.error,
                  ),
                ),
              ),
              title: Text(
                favRestaurants.name,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        favRestaurants.city,
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
                        favRestaurants.rating.toString(),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
