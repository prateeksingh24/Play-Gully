import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class AppColor {
  static Color kMain = const Color(0xff11132A);
  static Color kSecondary = const Color.fromARGB(255, 36, 39, 74);
  static Color kAccent = const Color(0xfff4f4f2);
  static Color kAppBar = const Color.fromARGB(255, 181, 43, 33);
  static Gradient kGradient = const LinearGradient(
    colors: [
      Color(0xff11132A),
      Color.fromARGB(255, 41, 23, 70),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static Gradient kGradient2 = const LinearGradient(
    colors: [
      Color(0xffC30FFF),
      Color.fromARGB(255, 41, 23, 70),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

const GradientBoxBorder kBorder = GradientBoxBorder(
  gradient: LinearGradient(
    colors: [Color(0xfffbaf0c), Color(0xfffbaf0c)],
  ),
  width: 0.1,
);
