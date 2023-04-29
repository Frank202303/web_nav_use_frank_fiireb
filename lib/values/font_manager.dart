/// Defines the font used by the app
/// how to use
///
///
///  TextSpan(
///         text: HAStrings.forMoreInformation,
///         style: HAFonts.poppinsBold(12, PXFColors.gray24),
///         ),

import 'package:flutter/material.dart';

class HAFonts {
  static TextStyle poppinsBold(double fontSize, Color color,
      {double? height, TextDecoration? decoration}) {
    return TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        fontSize: fontSize,
        color: color,
        height: height,
        decoration: decoration ?? TextDecoration.none);
  }

  static TextStyle poppinsSemiBold(double fontSize, Color color,
      {double? height}) {
    return TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        fontSize: fontSize,
        color: color,
        height: height,
        decoration: TextDecoration.none);
  }

  static TextStyle poppinsMedium(double fontSize, Color color,
      {double? height}) {
    return TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
        color: color,
        height: height,
        decoration: TextDecoration.none);
  }

  static TextStyle poppinsLight(double fontSize, Color color,
      {double? height}) {
    return TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w300,
        fontSize: fontSize,
        color: color,
        height: height,
        decoration: TextDecoration.none);
  }

  static TextStyle poppinsRegular(double fontSize, Color color,
      {double? height, TextDecoration? decoration}) {
    return TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        fontSize: fontSize,
        color: color,
        height: height,
        decoration: decoration ?? TextDecoration.none);
  }

  static TextStyle poppinsRegularWithUnderline(double fontSize, Color color,
      {double? height}) {
    return TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        fontSize: fontSize,
        color: color,
        decorationThickness: 1,
        decoration: TextDecoration.underline,
        decorationStyle: TextDecorationStyle.solid,
        decorationColor: color,
        height: height);
  }

  static TextStyle poppinsRegularWithDeleteLine(double fontSize, Color color,
      {double? height}) {
    return TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        fontSize: fontSize,
        color: color,
        decorationThickness: 1,
        decoration: TextDecoration.lineThrough,
        decorationStyle: TextDecorationStyle.solid,
        decorationColor: color,
        height: height);
  }

  static TextStyle helveticaRegular(double fontSize, Color color,
      {double? height, TextDecoration? decoration}) {
    return TextStyle(
        fontFamily: 'Helvetica',
        fontWeight: FontWeight.w300,
        fontSize: fontSize,
        color: color,
        decoration: decoration,
        height: height);
  }

  static TextStyle nHaasRegular(double fontSize, Color color,
      {double? height}) {
    return TextStyle(
        fontFamily: 'NHaas_Grotesk_TXPro',
        fontWeight: FontWeight.w400,
        fontSize: fontSize,
        color: color,
        height: height,
        decoration: TextDecoration.none);
  }
}
