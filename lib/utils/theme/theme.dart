import 'package:dicoding_restaurant_app/utils/theme/widget_themes/appbar_theme.dart';
import 'package:dicoding_restaurant_app/utils/theme/widget_themes/bottom_sheet_theme.dart';
import 'package:dicoding_restaurant_app/utils/theme/widget_themes/checkbox_theme.dart';
import 'package:dicoding_restaurant_app/utils/theme/widget_themes/chip_theme.dart';
import 'package:dicoding_restaurant_app/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:dicoding_restaurant_app/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:dicoding_restaurant_app/utils/theme/widget_themes/text_field_theme.dart';
import 'package:dicoding_restaurant_app/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class DAppTheme {
  DAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: DColors.grey,
    brightness: Brightness.light,
    primaryColor: DColors.primary,
    textTheme: DTextTheme.lightTextTheme,
    chipTheme: DChipTheme.lightChipTheme,
    scaffoldBackgroundColor: DColors.white,
    appBarTheme: DAppBarTheme.lightAppBarTheme,
    checkboxTheme: DCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: DBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: DElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: DOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: DTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: DColors.grey,
    brightness: Brightness.dark,
    primaryColor: DColors.primary,
    textTheme: DTextTheme.darkTextTheme,
    chipTheme: DChipTheme.darkChipTheme,
    scaffoldBackgroundColor: DColors.black,
    appBarTheme: DAppBarTheme.darkAppBarTheme,
    checkboxTheme: DCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: DBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: DElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: DOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: DTextFormFieldTheme.darkInputDecorationTheme,
  );
}
