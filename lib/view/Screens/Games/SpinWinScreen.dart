import 'package:cash_point/AppColor.dart';
import 'package:cash_point/Widget/AppBarWidget.dart';
import 'package:cash_point/Widget/Buttons/CustomizeButton1.dart';
import 'package:cash_point/Widget/spinwheel.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class Spinwinscreen extends StatefulWidget {
  const Spinwinscreen({super.key});

  @override
  State<Spinwinscreen> createState() => _SpinwinscreenState();
}

class _SpinwinscreenState extends State<Spinwinscreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.kMain,
      appBar: AppBarWidget(title: "SPIN & WIN"),
      body: Container(
        height: height * 0.75,
        width: width,
        child: Spinwheel(),
      ),
    );
  }
}
