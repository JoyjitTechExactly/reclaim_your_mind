/*Common styles*/
import 'package:flutter/material.dart';
import 'package:authentication/theme/color/auth_colors.dart';

/// 🧩 Common text style extensions
extension TextStyleExtensions on TextStyle {
  // --- Preset styles ---
  TextStyle get heading32Blue => copyWith(
    fontSize: 32,
    color: AuthColors.blueTextColor,
    fontWeight: FontWeight.w400,
    fontFamily: 'VarelaRound',
  );

  TextStyle get heading26Blue => copyWith(
    fontSize: 26,
    color: AuthColors.blueTextColor,
    fontWeight: FontWeight.w400,
    fontFamily: 'VarelaRound',
  );

  TextStyle get heading24Blue => copyWith(
    fontSize: 24,
    color: AuthColors.blueTextColor,
    fontWeight: FontWeight.w600,
    fontFamily: 'VarelaRound',
  );

  TextStyle get headingBlack => copyWith(
    fontSize: 24,
    color: AuthColors.defaultTextColor,
    fontWeight: FontWeight.w600,
    fontFamily: 'VarelaRound',
  );

  TextStyle get headingGrey => copyWith(
    fontSize: 24,
    color: AuthColors.geryTextColor,
    fontWeight: FontWeight.w600,
    fontFamily: 'VarelaRound',
  );

  TextStyle get subHeadingBlue => copyWith(
    fontSize: 18,
    color: AuthColors.blueTextColor,
    fontWeight: FontWeight.w400,
    fontFamily: 'VarelaRound',
  );

  TextStyle get subHeadingBlack => copyWith(
    fontSize: 18,
    color: AuthColors.defaultTextColor,
    fontWeight: FontWeight.w400,
    fontFamily: 'VarelaRound',
  );

  TextStyle get subHeadingBlack16 => copyWith(
    fontSize: 16,
    color: AuthColors.defaultTextColor,
    fontWeight: FontWeight.w400,
    fontFamily: 'VarelaRound',
  );

  TextStyle get subHeadingGrey => copyWith(
    fontSize: 18,
    color: AuthColors.geryTextColor,
    fontWeight: FontWeight.w400,
    fontFamily: 'VarelaRound',
  );

  TextStyle get bodyBlack => copyWith(
    fontSize: 16,
    color: AuthColors.defaultTextColor,
    fontWeight: FontWeight.w400,
    fontFamily: 'VarelaRound',
  );

  TextStyle get bodyBlue => copyWith(
    fontSize: 16,
    color: AuthColors.blueTextColor,
    fontWeight: FontWeight.w400,
    fontFamily: 'VarelaRound',
  );

  TextStyle get bodyGrey => copyWith(
    fontSize: 16,
    color: AuthColors.geryTextColor,
    fontWeight: FontWeight.w400,
    fontFamily: 'VarelaRound',
  );

  TextStyle get bodySmall14 => copyWith(
    fontSize: 14,
    color: AuthColors.defaultTextColor,
    fontWeight: FontWeight.w400,
    fontFamily: 'VarelaRound',
  );

  TextStyle get bodySmall12 => copyWith(
    fontSize: 12,
    color: AuthColors.defaultTextColor,
    fontWeight: FontWeight.w400,
    fontFamily: 'VarelaRound',
  );

  // --- 🔹 Custom reusable method for dynamic styles ---
  TextStyle custom({
    double? size,
    Color? color,
    FontWeight? weight,
    double? letterSpacing = 0.0,
    String? fontFamily = 'VarelaRound',
  }) {
    return copyWith(
      fontSize: size,
      color: color,
      fontWeight: weight,
      letterSpacing: letterSpacing,
      fontFamily: fontFamily,
    );
  }
}


/*Spacing Size box*/
extension SpaceExtension on num {
  SizedBox get h => SizedBox(height: toDouble());
  SizedBox get w => SizedBox(width: toDouble());
}
