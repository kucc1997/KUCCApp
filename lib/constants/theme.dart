import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData kTheme() {
  return ThemeData(
    primaryColor: Pallet.primaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Pallet.primaryColor,
      onPrimary: Pallet.onPrimary,
      secondary: Pallet.secondaryColor,
      background: Pallet.backgroundColor,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: Fonts.heading,
        fontSize: FontSizes.heading,
        fontWeight: FontWeights.bold,
        color: Pallet.textColor,
      ),
      displayMedium: TextStyle(
        fontFamily: Fonts.heading,
        fontSize: FontSizes.subHeading,
        fontWeight: FontWeights.bold,
        color: Pallet.textColor,
      ),
      bodyLarge: TextStyle(
        fontFamily: Fonts.body,
        fontSize: FontSizes.body,
        fontWeight: FontWeights.regular,
        color: Pallet.textColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: Fonts.body,
        fontSize: FontSizes.body,
        fontWeight: FontWeights.regular,
        color: Pallet.textColor,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Pallet.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(BorderRadii.medium),
      ),
    ),
  );
}
