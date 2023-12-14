import 'package:dicoding_restaurant_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import '../../constants/sizes.dart';

class DTextFormFieldTheme {
  DTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: DColors.darkGrey,
    suffixIconColor: DColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: DSizes.inputFieldHeight),
    labelStyle: const TextStyle()
        .copyWith(fontSize: DSizes.fontSizeMd, color: DColors.black),
    hintStyle: const TextStyle()
        .copyWith(fontSize: DSizes.fontSizeSm, color: DColors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: DColors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(DSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: DColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(DSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: DColors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(DSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: DColors.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(DSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: DColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(DSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: DColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: DColors.darkGrey,
    suffixIconColor: DColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: DSizes.inputFieldHeight),
    labelStyle: const TextStyle()
        .copyWith(fontSize: DSizes.fontSizeMd, color: DColors.white),
    hintStyle: const TextStyle()
        .copyWith(fontSize: DSizes.fontSizeSm, color: DColors.white),
    floatingLabelStyle:
        const TextStyle().copyWith(color: DColors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(DSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: DColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(DSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: DColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(DSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: DColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(DSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: DColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(DSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: DColors.warning),
    ),
  );
}
