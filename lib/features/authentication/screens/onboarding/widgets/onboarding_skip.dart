import 'package:dicoding_restaurant_app/features/authentication/controller/onboarding/onboarding_controller.dart';
import 'package:dicoding_restaurant_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => OnBoardingController.instance.skipPage(),
      child: const Text(
        DTexts.skip,
      ),
    );
  }
}
