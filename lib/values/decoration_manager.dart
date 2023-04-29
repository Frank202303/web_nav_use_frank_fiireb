/// Define the common decoration in this file:  The return type is 'BoxDecoration'
/// how to use
/// Container(
///    decoration: HADecoration.colorDecoration(color: Colors.brighterGray, radius: 5),
/// )

import 'package:flutter/cupertino.dart';

import 'color_manager.dart';

class HADecoration {
  static BoxDecoration standardBackground() {
    return gradientDecoration(
        colors: [HAColors.primaryWhite, HAColors.lighterGray], radius: 0);
  }

  static BoxDecoration gradientDecoration(
      {List<Color>? colors, double? radius}) {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: colors ?? [HAColors.primaryBlack, HAColors.secondaryGray],
      ),
      borderRadius: BorderRadius.all(Radius.circular(radius ?? 22)),
    );
  }

  static BoxDecoration colorDecoration({Color? color, double? radius}) {
    return BoxDecoration(
        color: color ?? HAColors.primaryOrange,
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 22)));
  }
}
