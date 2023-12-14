import 'package:dicoding_restaurant_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:dicoding_restaurant_app/utils/constants/colors.dart';
import 'package:dicoding_restaurant_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final darkMode = DHelperFunctions.isDarkMode(context);

    return SmoothPageIndicator(
      controller: controller.pageController,
      onDotClicked: controller.dotNavigationClick,
      count: 3,
      effect: ExpandingDotsEffect(
        activeDotColor: darkMode ? DColors.light : DColors.dark,
        dotHeight: 6.0,
      ),
    );
  }
}
