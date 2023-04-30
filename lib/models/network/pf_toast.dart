import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PFToast {
  static void showToast(String content,
      {Toast length = Toast.LENGTH_SHORT,
      ToastGravity gravity = ToastGravity.BOTTOM,
      double fontSize = 16,
      Color backgroundColor = Colors.black54,
      Color textColor = Colors.white}) {
    if (content.isNotEmpty) {
      Fluttertoast.showToast(
        msg: content,
        toastLength: length,
        gravity: gravity,
        timeInSecForIosWeb: 3,
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontSize: fontSize,
      );
    }
  }
}
