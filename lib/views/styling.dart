import 'package:flutter/material.dart';

abstract class CustomTextStyles {
  static const h1 = TextStyle(
      fontSize: 32, fontWeight: FontWeight.w600, letterSpacing: 0, color: CustomColors.textColor);

  static const h2 = TextStyle(
      fontSize: 24, fontWeight: FontWeight.w600, letterSpacing: 0, color: CustomColors.textColor);

  static const main = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0, color: CustomColors.textColor);

  static const mainBold = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0, color: CustomColors.textColor);

  static const secondary = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0, color: CustomColors.textColor);

  static const secondaryBold = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0, color: CustomColors.textColor);
}

abstract class CustomColors {
  static const main = Color(0xFFF8F4FF);

  static const blue = Color(0xFF00B9E8);
  static const black = Color(0xFF111111);

  static const textColor = Color(0xFF111111);
  static const placeholder = Color(0xFFBFBFBF);
}
