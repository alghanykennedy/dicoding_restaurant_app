import 'package:dicoding_restaurant_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../model/restaurant_model.dart';

class DetailScreen extends StatelessWidget {
  final RestaurantModel restaurant;

  const DetailScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Restaurant'),
        backgroundColor: DColors.primary,
      ),
      body: SingleChildScrollView(
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
                  restaurant.name,
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
                      restaurant.rating.toString(),
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
                        restaurant.city,
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
            Image.network(restaurant.pictureId),
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
                Text(restaurant.description)
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
                    itemCount: restaurant.foods.length,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(
                      right: 20,
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 25,
                    ),
                    itemBuilder: (context, index) {
                      final foods = restaurant.foods[index];
                      return Container(
                        width: 110,
                        decoration: BoxDecoration(
                          color: DColors.secondary,
                          borderRadius: BorderRadius.circular(
                            16,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              foods.name,
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
                    itemCount: restaurant.drinks.length,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(
                      right: 20,
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 25,
                    ),
                    itemBuilder: (context, index) {
                      final drinks = restaurant.drinks[index];
                      return Container(
                        width: 110,
                        decoration: BoxDecoration(
                          color: DColors.primary,
                          borderRadius: BorderRadius.circular(
                            16,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              drinks.name,
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
          ],
        ),
      ),
    );
  }
}
