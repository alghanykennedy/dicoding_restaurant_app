import 'package:dicoding_restaurant_app/utils/constants/image_strings.dart';
import 'package:dicoding_restaurant_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../controller/onboarding/onboarding_controller.dart';
import 'widgets/onboarding_dot_navigation.dart';
import 'widgets/onboarding_next_button.dart';
import 'widgets/onboarding_page.dart';
import 'widgets/onboarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: DImages.onBoardingImage1,
                title: DTexts.onBoardingTitle1,
                subTitle: DTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: DImages.onBoardingImage2,
                title: DTexts.onBoardingTitle2,
                subTitle: DTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: DImages.onBoardingImage3,
                title: DTexts.onBoardingTitle3,
                subTitle: DTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 120,
              width: DDeviceUtils.getScreenWidth(context),
              // color: Colors.greenAccent,
              child: const Padding(
                padding: EdgeInsets.all(DSizes.defaultSpace),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Skip Button
                    OnBoardingSkip(),

                    /// Dot Navigation SmoothPageIndicator
                    OnBoardingDotNavigation(),

                    /// Circular Button
                    OnBoardingNextButton(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
