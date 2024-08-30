import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class Custombox1 extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  const Custombox1(
      {super.key,
      required this.image,
      required this.title,
      required this.price});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          // width: 150,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            gradient: const LinearGradient(
              colors: [
                Color(0xff11132A),
                // Color(0xff11132A),
                Color.fromARGB(255, 41, 23, 70),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: const GradientBoxBorder(
              gradient: LinearGradient(colors: [
                Color(0xfffbaf0c),
                Color(0xfffbaf0c),
              ]),
              width: 0.1,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 7),
                child: Image.asset(
                  image,
                  width: 50,
                  height: 60,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(title,
                        style: width < 400
                            ? TextStyle(fontSize: 14)
                            : TextStyle(fontSize: 16)),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/Icons/star.png",
                          width: 18,
                          height: 18,
                        ),
                        Text(price),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
