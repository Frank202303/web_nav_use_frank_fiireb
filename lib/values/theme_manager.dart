/// Global Management Theme

import 'package:flutter/material.dart';

import 'color_manager.dart';

final ThemeData holidayAirTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: HAColors.primaryWhite,
  backgroundColor: HAColors.primaryBlack,
  dialogBackgroundColor: Colors.white,
  dialogTheme: const DialogTheme(backgroundColor: Colors.white),
  appBarTheme: const AppBarTheme(
    backgroundColor: HAColors.haBlue,

    /// set appBar text color
    foregroundColor: HAColors.primaryBlack,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    /// set elevatedButton color and text color
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
        HAColors.haBlue,
      ), //button color
      foregroundColor: MaterialStateProperty.all<Color>(
        HAColors.primaryBlack,
      ), //text (and icon)
      /// set BorderRadius
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(22))),
    ),
  ),
  fontFamily: 'Poppins',
  textTheme: const TextTheme(),
);
