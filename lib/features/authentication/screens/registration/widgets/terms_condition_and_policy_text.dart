import 'package:dicoding_restaurant_app/utils/constants/sizes.dart';
import 'package:dicoding_restaurant_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class TermsConditionPolicy extends StatelessWidget {
  const TermsConditionPolicy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 320,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: DTexts.iAgreeTo,
              style: TextStyle(
                color: Color(0xFF242323),
                fontSize: DSizes.fontSizeXs,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            TextSpan(
              text: DTexts.termsConditions,
              style: TextStyle(
                color: Color(0xFF32B768),
                fontSize: DSizes.fontSizeXs,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            TextSpan(
              text: ' and ',
              style: TextStyle(
                color: Color(0xFF242323),
                fontSize: DSizes.fontSizeXs,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            TextSpan(
              text: DTexts.privacyPolicy,
              style: TextStyle(
                color: Color(0xFF32B768),
                fontSize: DSizes.fontSizeXs,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
