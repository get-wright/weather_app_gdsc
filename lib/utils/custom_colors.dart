import 'package:flutter/material.dart';

class CustomColors {
  static const dividerLine = Color.fromARGB(255, 233, 221, 221);
  static const cardColor = Color.fromARGB(255, 229, 232, 236);
  static const textColorBlack = Color(0xff171717);
  static const firstGradientColor = Color.fromARGB(255, 24, 129, 249);
  static const secondGradientColor = Color.fromARGB(255, 10, 83, 184);
  static const textColorWhite = Color(0xFFFFFFFF);
  static const appBarButtonColor = Color(0xFFFFFFFF);
  static const loadingColor = Color.fromARGB(255, 31, 50, 193);
  static const backgroudColor = Color.fromARGB(255, 218, 212, 216);
  static Color getTextColor(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return Colors.white;
    } else {
      return Color(0xff171717); // Original text color
    }
  }
}
