import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class Customizebutton1 extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const Customizebutton1({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 30,
        decoration: BoxDecoration(
            // color: Color(0xffC30FFF),
            gradient: const LinearGradient(
              colors: [
                Color(0xffC30FFF),
                Color.fromARGB(255, 41, 23, 70),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: const GradientBoxBorder(
              gradient: LinearGradient(
                colors: [Color(0xfffbaf0c), Color(0xfffbaf0c)],
              ),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Center(child: Text(text)),
      ),
    );
  }
}
