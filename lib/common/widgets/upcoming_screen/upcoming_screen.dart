import 'package:dicoding_restaurant_app/common/styles/spacing_styles.dart';
import 'package:dicoding_restaurant_app/utils/constants/sizes.dart';
import 'package:dicoding_restaurant_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class UpcomingScreen extends StatelessWidget {
  const UpcomingScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: DSpacingStyles.paddingWithAppBarHeight * 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Image
              Image(
                image: AssetImage(
                  image,
                ),
                width: DHelperFunctions.screenWidth(),
              ),
              const SizedBox(
                height: DSizes.spaceBtwSections,
              ),

              /// Tittle & Subtitle
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: DSizes.spaceBtwItems,
              ),
              Text(
                subTitle,
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
    );
  }
}
