import 'package:dicoding_restaurant_app/utils/constants/colors.dart';
import 'package:dicoding_restaurant_app/utils/constants/image_strings.dart';
import 'package:dicoding_restaurant_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: DColors.grey,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: DSizes.iconMd,
              height: DSizes.iconMd,
              image: AssetImage(
                DImages.google,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: DSizes.spaceBtwItems,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: DColors.grey,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: DSizes.iconMd,
              height: DSizes.iconMd,
              image: AssetImage(
                DImages.facebook,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
