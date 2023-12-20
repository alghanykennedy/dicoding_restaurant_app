import 'package:dicoding_restaurant_app/utils/constants/api_constants.dart';
import 'package:dicoding_restaurant_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';
import '../../controllers/home/home_controller.dart';
import '../noInternet/no_internet_connection.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RestaurantController controller = Get.put(RestaurantController());
    final data = controller.detailRestaurants.value;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Restaurant',
          style: TextStyle(
            color: DColors.textWhite,
          ),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: DColors.white,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: DColors.primary,
      ),
      body: Obx(
        () => controller.connectionStatus.value == 1
            ? SingleChildScrollView(
                padding: const EdgeInsets.only(
                  left: 24,
                  top: 15,
                  right: 24,
                  bottom: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data?.restaurant?.name ?? '',
                          style: const TextStyle(
                            color: Color(0xFF1F2937),
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                        const SizedBox(
                          height: DSizes.sm,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              size: 20,
                              color: DColors.yellow,
                            ),
                            const SizedBox(
                              width: DSizes.xs,
                            ),
                            Text(
                              data?.restaurant?.rating.toString() ?? '0.0',
                            ),
                            const SizedBox(
                              width: DSizes.lg,
                            ),
                            const Icon(
                              Icons.location_on,
                              size: 20,
                              color: DColors.primary,
                            ),
                            const SizedBox(
                              width: DSizes.xs,
                            ),
                            SizedBox(
                              width: 210,
                              child: Text(
                                data?.restaurant?.address ?? '',
                                style: const TextStyle(
                                  color: Color(0xFF6B7280),
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Image.network(
                      Constants.imageUrl + (data?.restaurant?.pictureId ?? ''),
                    ),
                    const SizedBox(height: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Description',
                          style: TextStyle(
                            color: Color(0xFF1F2937),
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                        const SizedBox(
                          height: DSizes.sm,
                        ),
                        Text(data?.restaurant?.description ?? '')
                      ],
                    ),
                    const SizedBox(
                      height: DSizes.spaceBtwItems,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Recommendation Food & Drinks',
                          style: TextStyle(
                            color: Color(0xFF1F2937),
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 125,
                          child: ListView.separated(
                            itemCount:
                                data?.restaurant?.menus?.foods?.length ?? 4,
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.only(
                              right: 20,
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 25,
                            ),
                            itemBuilder: (context, index) {
                              final foods =
                                  data?.restaurant?.menus?.foods?[index];
                              return Container(
                                width: 110,
                                decoration: BoxDecoration(
                                  color: DColors.secondary,
                                  borderRadius: BorderRadius.circular(
                                    16,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      foods?.name ?? "",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: DSizes.spaceBtwItems,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 125,
                          child: ListView.separated(
                            itemCount:
                                data?.restaurant?.menus?.drinks?.length ?? 4,
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.only(
                              right: 20,
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 25,
                            ),
                            itemBuilder: (context, index) {
                              final drinks =
                                  data?.restaurant?.menus?.drinks?[index];
                              // final drinks = restaurant.drinks[index];
                              return Container(
                                width: 110,
                                decoration: BoxDecoration(
                                  color: DColors.primary,
                                  borderRadius: BorderRadius.circular(
                                    16,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      drinks?.name ?? "",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: DColors.textWhite,
                                        fontSize: 14,
                                      ),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: DSizes.spaceBtwItems,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Customer Reviews',
                          style: TextStyle(
                            color: Color(0xFF1F2937),
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 250,
                          child: ListView.separated(
                            itemCount:
                                data?.restaurant?.customerReviews?.length ?? 4,
                            scrollDirection: Axis.vertical,
                            padding: const EdgeInsets.only(
                              right: 20,
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 10,
                            ),
                            itemBuilder: (context, index) {
                              final reviews =
                                  data?.restaurant?.customerReviews?[index];
                              return Card(
                                child: ListTile(
                                  leading: Container(
                                    width: 55,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(35),
                                    ),
                                    child: Image.asset(
                                      'assets/images/content/user.png',
                                    ),
                                  ),
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        reviews?.name ?? "",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        reviews?.date ?? "",
                                        style: const TextStyle(
                                          color: Color(0xFF6E6E6E),
                                          fontSize: 14,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const SizedBox(height: DSizes.sm),
                                    ],
                                  ),
                                  subtitle: Text(reviews?.review ?? ""),
                                  // trailing: const Icon(Icons.more_vert),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : const NoInternetConnection(),
      ),
    );
  }
}
