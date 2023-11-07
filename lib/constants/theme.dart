import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData kTheme() {
  return ThemeData(
    primaryColor: Palette.primaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Palette.primaryColor,
      onPrimary: Palette.onPrimary,
      secondary: Palette.secondaryColor,
      background: Palette.backgroundColor,
    ),
    textTheme: TextTheme(
      displayLarge: const TextStyle(
        fontFamily: Fonts.heading,
        fontSize: FontSizes.heading,
        fontWeight: FontWeights.bold,
        color: Palette.textColor,
      ),
      displayMedium: const TextStyle(
        fontFamily: Fonts.heading,
        fontSize: FontSizes.subHeading,
        fontWeight: FontWeights.bold,
        color: Palette.textColor,
      ),
      bodyLarge: const TextStyle(
        fontFamily: Fonts.body,
        fontSize: FontSizes.body,
        fontWeight: FontWeights.regular,
        color: Palette.textColor,
      ),
      bodyMedium: const TextStyle(
        fontFamily: Fonts.body,
        fontSize: FontSizes.body,
        fontWeight: FontWeights.regular,
        color: Palette.textColor,
      ),
      bodySmall: TextStyle(
          fontSize: FontSizes.designation,
          fontFamily: Fonts.designation,
          color: Color(0xFF394078).withOpacity(0.75),
          fontWeight: FontWeights.light,
          letterSpacing: 1,
          wordSpacing: 0.5),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Palette.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(BorderRadii.medium),
      ),
    ),
  );
}
