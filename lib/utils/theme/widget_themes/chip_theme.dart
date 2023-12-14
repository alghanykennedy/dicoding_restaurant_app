import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class DChipTheme {
  DChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: DColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(
      color: DColors.black,
    ),
    selectedColor: DColors.primary,
    padding: const EdgeInsets.symmetric(
      horizontal: 12.0,
      vertical: 12,
    ),
    checkmarkColor: DColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: DColors.darkerGrey,
    labelStyle: TextStyle(
      color: DColors.white,
    ),
    selectedColor: DColors.primary,
    padding: EdgeInsets.symmetric(
      horizontal: 12.0,
      vertical: 12,
    ),
    checkmarkColor: DColors.white,
  );
}
