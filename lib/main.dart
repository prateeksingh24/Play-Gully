import 'package:cash_point/Theme/darkTheme.dart';
import 'package:cash_point/view/Home.dart';
import 'package:cash_point/view/Screens/Games/SpinWinScreen.dart';
import 'package:cash_point/view/Screens/SplashScreen.dart';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      home:  MyCustomSplashScreen(),
    );
  }
}
