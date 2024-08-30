import 'package:cash_point/AppColor.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.dark(
      surface: Colors.black,
      primary: Colors.grey.shade200,
      secondary: Colors.white,
      inversePrimary: Colors.grey.shade700,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.kSecondary, // Set the fixed AppBar color here
      foregroundColor: Colors.white, // Optional: Set the text/icon color
    ),
    fontFamily: "Esportive");
