import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/* -- Light & Dark Elevated Button Themes -- */
class DElevatedButtonTheme {
  DElevatedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: DColors.light,
      backgroundColor: DColors.primary,
      disabledForegroundColor: DColors.darkGrey,
      disabledBackgroundColor: DColors.buttonDisabled,
      side: const BorderSide(color: DColors.primary),
      padding: const EdgeInsets.symmetric(vertical: DSizes.buttonHeight),
      textStyle: const TextStyle(
        fontSize: 16,
        color: DColors.textWhite,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DSizes.buttonRadius),
      ),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: DColors.light,
      backgroundColor: DColors.primary,
      disabledForegroundColor: DColors.darkGrey,
      disabledBackgroundColor: DColors.darkerGrey,
      side: const BorderSide(color: DColors.primary),
      padding: const EdgeInsets.symmetric(vertical: DSizes.buttonHeight),
      textStyle: const TextStyle(
        fontSize: 16,
        color: DColors.textWhite,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DSizes.buttonRadius),
      ),
    ),
  );
}
