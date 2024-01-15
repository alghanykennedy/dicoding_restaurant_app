import 'package:dicoding_restaurant_app/utils/constants/image_strings.dart';
import 'package:dicoding_restaurant_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/styles/spacing_styles.dart';
import '../../../utils/constants/api_constants.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../authentication/controller/home/home_controller.dart';
import '../../authentication/model/restaurants_model.dart';
import '../../authentication/screens/home/detail_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RestaurantController controller = Get.put(RestaurantController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: DColors.primary,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Favorite",
          style: TextStyle(
            color: DColors.textWhite,
          ),
        ),
      ),
      body: Obx(
        () => controller.favoriteRestaurants.isNotEmpty
            ? ListView.builder(
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
                      trailing: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Delete Favorite'),
                                  content: const SingleChildScrollView(
                                    child: ListBody(
                                      children: [
                                        Text(
                                          'Are you sure want to delete favorite?',
                                        )
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text('No'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        RestaurantsModel fav = RestaurantsModel(
                                          id: favRestaurants.id,
                                          name: favRestaurants.name,
                                          city: favRestaurants.city,
                                          description:
                                              favRestaurants.description,
                                          pictureId: favRestaurants.pictureId,
                                          rating: favRestaurants.rating,
                                        );
                                        controller.removeFromFavorites(fav);
                                        Get.back();
                                      },
                                      child: const Text('Yes'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.more_vert)));
                },
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: DSpacingStyles.paddingWithAppBarHeight * 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /// Image
                      Image(
                        image: const AssetImage(
                          DImages.upComingImage,
                        ),
                        width: DHelperFunctions.screenWidth(),
                      ),
                      const SizedBox(
                        height: DSizes.spaceBtwSections,
                      ),

                      /// Tittle & Subtitle
                      Text(
                        "You don't have favorite restaurant",
                        style: Theme.of(context).textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: DSizes.spaceBtwItems,
                      ),
                      Text(
                        "",
                        style: Theme.of(context).textTheme.labelLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: DSizes.spaceBtwItems,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
