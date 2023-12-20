import 'package:dicoding_restaurant_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/content/noInternet.png'),
          const Text(
            'Network Error',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          const Text(
            'Internet not found, please check your connection',
            style: TextStyle(
              color: Color(0xFF6E6E6E),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: DSizes.spaceBtwItems,
          ),
        ],
      ),
    );
  }
}
