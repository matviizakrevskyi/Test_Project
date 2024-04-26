import 'package:flutter/material.dart';

abstract class CustomTextStyles {
  static const main = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      color: CustomColors.textColor);

  static const mainBold = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      color: CustomColors.textColor);

  static const secondary = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      color: CustomColors.textColor);

  static const secondaryBold = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      color: CustomColors.textColor);
}

abstract class CustomColors {
  static const main = Color(0xFFF8F4FF);

  static const textColor = Colors.black;
  static const placeholder = Color(0xFFBFBFBF);
}
