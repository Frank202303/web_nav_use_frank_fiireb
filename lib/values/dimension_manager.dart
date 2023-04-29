/// Define commonly used dimensions
/// how to use
/// padding: const EdgeInsets.all(HADimension.commonPadding),
///
import 'package:flutter/cupertino.dart';

class HADimension {
  static const double screenHPadding = 20; // screen Horizontal padding
  static const double standardBPadding = 40; // screen Bottom padding
  static const double standardTTopPadding = 16; // screen Text Top padding
  static double safeBarTopPadding(BuildContext ctx) =>
      MediaQuery.of(ctx).padding.top;
  static const double toolBarHeight = 64;
  static const double commonPadding = 16.0;
}
