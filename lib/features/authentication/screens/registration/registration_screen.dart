import 'package:dicoding_restaurant_app/features/authentication/screens/registration/widgets/button_submit.dart';
import 'package:dicoding_restaurant_app/features/authentication/screens/registration/widgets/registration_page.dart';
import 'package:dicoding_restaurant_app/navigation_menu.dart';
import 'package:dicoding_restaurant_app/utils/constants/colors.dart';
import 'package:dicoding_restaurant_app/utils/constants/image_strings.dart';
import 'package:dicoding_restaurant_app/utils/constants/sizes.dart';
import 'package:dicoding_restaurant_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/terms_condition_and_policy_text.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const RegistrationPage(
            image: DImages.onBoardingImage4,
            title: DTexts.onBoardingTitle4,
            subTitle: DTexts.onBoardingSubTitle4,
          ),
          const SizedBox(
            height: DSizes.spaceBtwSections,
          ),
          ButtonSubmit(
            borderColor: DColors.primary,
            buttonColor: DColors.primary,
            buttonText: DTexts.createAccount,
            textColor: DColors.textWhite,
            onPressed: () {},
          ),
          const SizedBox(
            height: DSizes.spaceBtwItems,
          ),
          ButtonSubmit(
            borderColor: DColors.secondary,
            buttonColor: DColors.secondary,
            buttonText: DTexts.login,
            textColor: DColors.primary,
            onPressed: () => Get.to(
              () => const NavigationMenu(),
            ),
          ),
          const SizedBox(
            height: DSizes.spaceBtwItems,
          ),
          const TermsConditionPolicy(),
        ],
      ),
    );
  }
}
