import 'package:dicoding_restaurant_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:flutter/material.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => OnBoardingController.instance.nextPage(),
      icon: const Icon(
        Icons.arrow_forward,
      ),
    );
  }
}
